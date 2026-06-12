using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualBasic;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Text;

namespace mobileyeOTA
{
    public class BinFileReader
    {
        private byte[] DataByte;
        private long Address;

        private long ReadPointer;

        private StreamReader srBinFile;
        public BinFileReader(string Path)
        {
            srBinFile = new StreamReader(Path);
        }

        public void Dispose()
        {
            srBinFile.Close();
            srBinFile.Dispose();
        }

        public void Rewind()
        {
            ReadPointer = 0;
        }

        public bool ReadNextBlock(ref long retAddress, ref string retData)
        {
            long AddressStart = -1;
            long ReadSize = 0;
            long i = 0;
            byte[] buffer;


            retData = "";
            retAddress = -1;

            if (ReadPointer >= DataByte.Length)
            {
                return false;
            }

            AddressStart = ReadPointer + Address;

            ReadSize = DataByte.Length - ReadPointer;
            if (ReadSize > 40)
            {
                ReadSize = 40;
                buffer = new byte[40];
            }
            buffer = new byte[ReadSize];

            for (i = 0; i <= ReadSize - 1; i++)
            {
                //retData += ByteToHex(DataByte[ReadPointer]);
                buffer[i] = DataByte[ReadPointer];
                
                ReadPointer += 1;
            }
            string hex = BitConverter.ToString(buffer);
            retData += hex.Replace("-", "");



            retAddress = AddressStart;

            return true;
        }

        public bool ReadIntoMemory()
        {
            string Data = null;
            ArrayList b = new ArrayList();
            int i = 0;
            int count = 0;

            // Rewind file
            srBinFile.BaseStream.Position = 0;
            srBinFile.DiscardBufferedData();

            Address = 0x8002000;
            Data = srBinFile.ReadToEnd();

            count = Conversion.Fix(Data.Length / 2);

            for (i = 0; i <= count - 1; i++)
            {
                b.Add(HexToByte(Data.Substring(i * 2, 2)));
            }

            DataByte = (byte[])b.ToArray(typeof(byte));

            return true;
        }

        public string retlastfewbytes()
        {
            int asd = DataByte.Length-5;
            byte qwe = DataByte[asd+1];
            byte qwe2 = DataByte[asd + 2];
            byte qwe3 = DataByte[asd + 3];
            byte qwe4 = DataByte[asd + 4];

            return qwe.ToString("X2") + qwe2.ToString("X2") + qwe3.ToString("X2") + qwe4.ToString("X2");
        }

        public static byte HexToByte(string str)
        {
            int a = 0;
            int i = 0;
            byte dec = 0;

            while (i < 2 & i < str.Length)
            {
                dec *= 16;
                a = Strings.Asc(str.ElementAt(i));
                if (a >= Strings.Asc("0") & a <= Strings.Asc("9"))
                {
                    dec += (byte) (a - Strings.Asc("0"));
                }
                else if (a >= Strings.Asc("A") & a <= Strings.Asc("F"))
                {
                    dec += (byte) (a - Strings.Asc("A") + 10);
                }
                else {
                    return 0;
                }
                i += 1;
            }

            return dec;
        }

        public static string ByteToHex(byte b)
        {
            string ret = b.ToString("X2");
            /*
            string ret = null;
            char[] Hex = new char[2];
            byte a = 0;

            a = (byte) (b >> 4);
            if (a < 10)
            {
                Hex[0] = Strings.Chr(a + Strings.Asc("0"));
            }
            else {
                Hex[0] = Strings.Chr(a - 10 + Strings.Asc("A"));
            }
            a = (byte) (b & 15);
            if (a < 10)
            {
                Hex[1] = Strings.Chr(a + Strings.Asc("0"));
            }
            else {
                Hex[1] = Strings.Chr(a - 10 + Strings.Asc("A"));
            }

            ret = Hex.ToString();
            */
            return ret;
        }

    }

    
}
