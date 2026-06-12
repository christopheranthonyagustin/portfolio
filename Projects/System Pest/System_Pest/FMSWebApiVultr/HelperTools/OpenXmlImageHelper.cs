using System;
using System.IO;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Wordprocessing;
using DW = DocumentFormat.OpenXml.Drawing.Wordprocessing;
using A = DocumentFormat.OpenXml.Drawing;
using PIC = DocumentFormat.OpenXml.Drawing.Pictures;
using DocumentFormat.OpenXml;

namespace FMSWebApiVultr.HelperTools
{
    public static class OpenXmlImageHelper
    {
        /// <summary>
        /// Inserts an image into a Word run at the run's position.
        /// Maintains aspect ratio and sets max width/height.
        /// </summary>
        public static void InsertImageAtRun(MainDocumentPart mainPart, Run run, string imagePath, long maxWidthEmu = 2500000, long maxHeightEmu = 2500000)
        {
            if (mainPart == null || run == null || string.IsNullOrEmpty(imagePath) || !File.Exists(imagePath))
                return;

            ImagePart imagePart = mainPart.AddImagePart(ImagePartType.Png);

            using (FileStream stream = new FileStream(imagePath, FileMode.Open, FileAccess.Read))
            {
                imagePart.FeedData(stream);
            }

            string relationshipId = mainPart.GetIdOfPart(imagePart);

            // Get original image size
            using (System.Drawing.Image img = System.Drawing.Image.FromFile(imagePath))
            {
                const long emusPerInch = 914400;
                float hRes = img.HorizontalResolution;
                float vRes = img.VerticalResolution;

                long widthEmu = (long)(img.Width / hRes * emusPerInch);
                long heightEmu = (long)(img.Height / vRes * emusPerInch);

                // Maintain aspect ratio and limit size
                double ratio = Math.Min((double)maxWidthEmu / widthEmu, (double)maxHeightEmu / heightEmu);
                if (ratio < 1.0)
                {
                    widthEmu = (long)(widthEmu * ratio);
                    heightEmu = (long)(heightEmu * ratio);
                }

                // Create the drawing object
                var element = new Drawing(
                    new DW.Inline(
                        new DW.Extent() { Cx = widthEmu, Cy = heightEmu },
                        new DW.EffectExtent() { LeftEdge = 0L, TopEdge = 0L, RightEdge = 0L, BottomEdge = 0L },
                        new DW.DocProperties() { Id = (UInt32Value)1U, Name = Path.GetFileName(imagePath) },
                        new DW.NonVisualGraphicFrameDrawingProperties(
                            new A.GraphicFrameLocks() { NoChangeAspect = true }),
                        new A.Graphic(
                            new A.GraphicData(
                                new PIC.Picture(
                                    new PIC.NonVisualPictureProperties(
                                        new PIC.NonVisualDrawingProperties() { Id = (UInt32Value)0U, Name = Path.GetFileName(imagePath) },
                                        new PIC.NonVisualPictureDrawingProperties()),
                                    new PIC.BlipFill(
                                        new A.Blip() { Embed = relationshipId, CompressionState = A.BlipCompressionValues.Print },
                                        new A.Stretch(new A.FillRectangle())),
                                    new PIC.ShapeProperties(
                                        new A.Transform2D(
                                            new A.Offset() { X = 0L, Y = 0L },
                                            new A.Extents() { Cx = widthEmu, Cy = heightEmu }),
                                        new A.PresetGeometry(new A.AdjustValueList()) { Preset = A.ShapeTypeValues.Rectangle })
                                )
                            )
                            { Uri = "http://schemas.openxmlformats.org/drawingml/2006/picture" }
                        )
                    )
                    {
                        DistanceFromTop = 0U,
                        DistanceFromBottom = 0U,
                        DistanceFromLeft = 0U,
                        DistanceFromRight = 0U
                    }
                );

                // Insert the drawing at the placeholder Run
                run.AppendChild(element);
            }
        }

    }
}
