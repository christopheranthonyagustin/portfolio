package sg.acecom.track.systempest.forms;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.ExceptionConverter;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;

import sg.acecom.track.systempest.R;

/**
 * Created by jmingl on 15/1/18.
 */

public class PageHeaderFooterMalaysia extends PdfPageEventHelper {

    Font ffont = new Font(Font.FontFamily.UNDEFINED, 5, Font.ITALIC);

    Context context;
    String projectName;
    String client_signature_path;
    String technician_signature_path;
    String address_information = "10, Ubi Crescent, #06-81, Ubi Tech Park, Singapore 408564.  Tel: 6748 8966 (4 lines)  Fax: 6749 8966";
    String contact_information = "Email: singapore@systempest.com  Website: www.systempest.com";
    String johor_address = "62, Jalan Lembah 1, Taman Desa Jaya, 81100 Johor Bahru, Malaysia";
    String johor_information = "Tel: +607-353 3266 Fax: +607-351 5616  Email: johor@systempest.com";
    String selangor_address = "93-2, Jalan 3/23A, Danau Kota, Setapak, 53300 Kuala Lumpur, Malaysia";
    String selangor_information = "Tel: +603-4142 4866 Fax: +603-4144 4866  Email: kualalumpur@systempest.com";
    String perak_address = "99A, Hala Sepakat 15A, Taman Pinggir Rapat Perdana, 31350, Ipoh, Perak, Malaysia";
    String perak_information = "Tel: +605-312 6166 Fax: +605-311 2166  Email: perak@systempest.com";
    String sarawak_address = "1st Floor, Sublot 5, Block 26, MTLD, Uni Square, Kuching-Kota Samarahan Expressway, 94300 Kota Samarahan, Sarawak, Malaysia";
    String sarawak_information = "Tel: +6082-371 366 Fax: +6082-663 766  Email: sarawak@systempest.com";
    String malacca_address = "No. 48-1, Jalan PPM 4, Plaza Pandan Malim, 75250 Melaka, Malaysia";
    String malacca_information = "Tel: +606-336 7366 Fax: +606-336 6066  Email: melaka@systempest.com";
    String singapore_hq_address = "10, Ubi Crescent, #06-81, Ubi Tech Park, Singapore 408564";
    String singapore_hq_information = "Tel: +65 6748 8966 Fax: +65 6749 8966";
    String singapore_branch_address = "Block 30, Defu Lane 10, #03-75, Singapore 539211";
    String singapore_branch_information = "Tel: +65-6283 6366 Fax: +65-6749 8966  Email: singapore@systempest.com";

    public PageHeaderFooterMalaysia(Context context, String projectName, String client_signature_path, String technician_signature_path) {
        this.context = context;
        this.projectName = projectName;
        this.client_signature_path = client_signature_path;
        this.technician_signature_path = technician_signature_path;
    }


    public void onEndPage(PdfWriter writer, Document document) {

        addHeader(writer, document);
        /*try {
            addTitlePage(document);
        } catch (DocumentException e) {
            e.printStackTrace();
            Log.e("TitlePage : ", String.valueOf(e));
        }*/
        /**
         * PdfContentByte is an object containing the user positioned text and graphic contents
         * of a page. It knows how to apply the proper font encoding.
         */
        PdfContentByte cb = writer.getDirectContent();


        /**
         * In iText a Phrase is a series of Chunks.
         * A chunk is the smallest significant part of text that can be added to a document.
         *  Most elements can be divided in one or more Chunks. A chunk is a String with a certain Font
         */
        Phrase footer_pageNumber = new Phrase("Page " + document.getPageNumber());

        // footer: show page number in the bottom right corner of each age
        /*ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT,
                footer_pageNumber,
                (document.getPageSize().getWidth() - 10),
                document.bottom() - 10, 0);*/

        try {
            addFooter(writer, document);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (BadElementException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        }

    }

    private void addHeader(PdfWriter writer, Document document){
        float[] columnWidths = {1, 3, 1};
        PdfPTable header = new PdfPTable(columnWidths);
        Drawable d;
        Bitmap bitmap;
        ByteArrayOutputStream stream;
        byte[] bitmapData;
        Image image;
        PdfPCell cell = new PdfPCell();
        try {
            header.setTotalWidth(document.right() - document.left());
            header.getDefaultCell().setBorderWidth(0f);

            cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,8, Font.ITALIC)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            d = context.getResources().getDrawable (R.drawable.formmy_systempestlogo);
            bitmap = ((BitmapDrawable)d).getBitmap();
            stream = new ByteArrayOutputStream();
            bitmap.compress(Bitmap.CompressFormat.JPEG, 30, stream);
            bitmapData = stream.toByteArray();
            image = Image.getInstance(bitmapData);
            image.scaleAbsolute(310f, 50f);
            cell.setBorder(Rectangle.NO_BORDER);
            cell = new PdfPCell(image);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            cell = new PdfPCell(new Phrase("SPC-QMS-01-F06", FontFactory.getFont(FontFactory.HELVETICA,8, Font.NORMAL)));
            cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,8, Font.ITALIC)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            cell = new PdfPCell(new Phrase("Website: www.systempest.com  GST No: 000506593280", FontFactory.getFont(FontFactory.HELVETICA,8, Font.ITALIC)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,8, Font.ITALIC)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,8, Font.ITALIC)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            cell = new PdfPCell(new Phrase("PEST CONTROL SERVICE REPORT", FontFactory.getFont(FontFactory.HELVETICA,8, Font.BOLD)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            cell = new PdfPCell(new Phrase(" ", FontFactory.getFont(FontFactory.HELVETICA,8, Font.ITALIC)));
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setBorder(Rectangle.NO_BORDER);
            header.addCell(cell);

            // write content
            header.writeSelectedRows(0, -1, 34, 820, writer.getDirectContent());
        } catch(DocumentException de) {
            throw new ExceptionConverter(de);
        } catch (MalformedURLException e) {
            throw new ExceptionConverter(e);
        } catch (IOException e) {
            throw new ExceptionConverter(e);
        }
    }

    private void addFooter(PdfWriter writer, Document document) throws IOException, DocumentException {
        float[] columnWidths = {1, 1, 1, 1, 1, 1, 1, 1};
        PdfPTable footer = new PdfPTable(columnWidths);
        Drawable d;
        Bitmap bitmap;
        Image image;
        ByteArrayOutputStream stream;
        byte[] bitmapData;
        PdfPCell cell = new PdfPCell();

        footer.setTotalWidth(document.right() - document.left());
        footer.getDefaultCell().setBorderWidth(0f);

        try{
            Image p_img = Image.getInstance(client_signature_path);
            p_img.setWidthPercentage(40);
            p_img.setAlignment(Element.ALIGN_CENTER);
            cell.addElement(p_img);
            cell.setColspan(3);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.BOTTOM);
            cell.setPaddingTop(5);
            //cell.setFixedHeight(30); //cell height
            footer.addCell(cell);
        }catch(IOException e){

        }

        //Second Line
        cell = new PdfPCell(new Phrase("  ", FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setColspan(2);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        footer.addCell(cell);

        try{
            Image p_img = Image.getInstance(technician_signature_path);
            p_img.setWidthPercentage(40);
            p_img.setAlignment(Element.ALIGN_CENTER);
            cell.addElement(p_img);
            cell.setColspan(3);
            cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
            cell.setBorder(Rectangle.BOTTOM);
            cell.setPaddingTop(5);
            //cell.setFixedHeight(30); //cell height
            footer.addCell(cell);
        }catch(IOException e){

        }

        cell = new PdfPCell(new Phrase("CLIENT NAME / SIGNATURE", FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(3);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        footer.addCell(cell);

        //Second Line
        cell = new PdfPCell(new Phrase("  ", FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        cell.setColspan(2);
        //cell.setFixedHeight(30); //cell height
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("TECHNICIAN NAME / SIGNATURE", FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL))); //Public static Font FONT_TABLE_HEADER = new Font(Font.FontFamily.HELVETICA, 12,Font.BOLD);
        //cell.setHorizontalAlignment(Element.ALIGN_CENTER); //alignment
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setColspan(3);
        cell.setPaddingTop(5);
        //cell.setFixedHeight(30); //cell height
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("Johor", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.TOP);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setPaddingTop(3);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("Melaka", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.TOP);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setPaddingTop(3);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase(johor_address + "\n" + johor_information, FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase(malacca_address + "\n" + malacca_information, FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("Selangor", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("Singapore HQ", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase(selangor_address + "\n" + selangor_information, FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase(singapore_hq_address + "\n" + singapore_hq_information, FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("Perak", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("Singapore Branch", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase(perak_address + "\n" + perak_information, FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase(singapore_branch_address + "\n" + singapore_branch_information, FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("Sarawak", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("", FontFactory.getFont(FontFactory.HELVETICA,6, Font.BOLD)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase(sarawak_address + "\n" + sarawak_information, FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        cell = new PdfPCell(new Phrase("", FontFactory.getFont(FontFactory.HELVETICA,6, Font.NORMAL)));
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setHorizontalAlignment(Element.ALIGN_LEFT);
        cell.setColspan(4);
        footer.addCell(cell);

        d = context.getResources().getDrawable (R.drawable.formmy_pcam);
        bitmap = ((BitmapDrawable)d).getBitmap();
        stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 30, stream);
        bitmapData = stream.toByteArray();
        image = Image.getInstance(bitmapData);
        image.scaleAbsolute(30f, 20f);
        cell.setBorder(Rectangle.NO_BORDER);
        cell = new PdfPCell(image);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setPaddingTop(5);
        cell.setColspan(2);
        cell.setBorder(Rectangle.NO_BORDER);
        footer.addCell(cell);

        d = context.getResources().getDrawable (R.drawable.formmy_kesihatan);
        bitmap = ((BitmapDrawable)d).getBitmap();
        stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 30, stream);
        bitmapData = stream.toByteArray();
        image = Image.getInstance(bitmapData);
        image.scaleAbsolute(30f, 20f);
        cell.setBorder(Rectangle.NO_BORDER);
        cell = new PdfPCell(image);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        cell.setColspan(2);
        footer.addCell(cell);

        d = context.getResources().getDrawable (R.drawable.formmy_jabatanpertanian);
        bitmap = ((BitmapDrawable)d).getBitmap();
        stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 30, stream);
        bitmapData = stream.toByteArray();
        image = Image.getInstance(bitmapData);
        image.scaleAbsolute(30f, 20f);
        cell.setBorder(Rectangle.NO_BORDER);
        cell = new PdfPCell(image);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        cell.setColspan(2);
        footer.addCell(cell);

        d = context.getResources().getDrawable (R.drawable.formmy_cidb);
        bitmap = ((BitmapDrawable)d).getBitmap();
        stream = new ByteArrayOutputStream();
        bitmap.compress(Bitmap.CompressFormat.JPEG, 30, stream);
        bitmapData = stream.toByteArray();
        image = Image.getInstance(bitmapData);
        image.scaleAbsolute(40f, 20f);
        cell.setBorder(Rectangle.NO_BORDER);
        cell = new PdfPCell(image);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorder(Rectangle.NO_BORDER);
        cell.setPaddingTop(5);
        cell.setColspan(2);
        footer.addCell(cell);


//        cell = new PdfPCell(new Phrase("Success Entrepreneur ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase("2011 Singapore Brand ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase("Asia Pacific ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase("Singapore Excellence Award 2012/2013 ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase("Biz Safe ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase("NPMA ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase("Bureau Veritas ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase("SPMA ", FontFactory.getFont(FontFactory.TIMES_ROMAN,8, Font.UNDERLINE)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        footer.addCell(cell);

//        cell = new PdfPCell(new Phrase(address_information, FontFactory.getFont(FontFactory.HELVETICA,8, Font.NORMAL)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setPaddingTop(5);
//        cell.setColspan(8);
//        footer.addCell(cell);
//
//        cell = new PdfPCell(new Phrase(contact_information, FontFactory.getFont(FontFactory.HELVETICA,8, Font.NORMAL)));
//        cell.setBorder(Rectangle.NO_BORDER);
//        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        cell.setColspan(8);
//        footer.addCell(cell);

        // write content
        footer.writeSelectedRows(0, -1, 36, 240, writer.getDirectContent());
    }

    /**
     * This method is used to add empty lines in the document
     * @param paragraph
     * @param number
     */
    private static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
}
