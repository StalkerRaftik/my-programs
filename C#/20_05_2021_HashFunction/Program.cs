using System;

namespace _20_05_2021_HashFunction
{
    class TwoLinkedList
    {
        public class Elem
        {
            public Elem Prev; // Previous
            public Elem Next; // Next
            public string Info;
        }

        public Elem Head;
        public Elem Tail;


        private bool compareFunc(string str1, string str2)
        {
            int length = str1.Length > str2.Length ? str2.Length : str1.Length;

            char chr1;
            char chr2;
            for (int i = 0; i < length; i++)
            {
                chr1 = str1[i];
                chr2 = str2[i];

                if (chr1 != chr2)
                    return chr1 > chr2;
            }

            if (str1.Length < str2.Length)
                return false;
            else if (str1.Length > str2.Length)
                return true;

            return false;
        }

        public void Add(string info)
        {
            Elem NewEl = new Elem();
            NewEl.Info = info;

            if (this.Head == null)
            {
                this.Head = NewEl;
                this.Tail = NewEl;
                return;
            }
                

            Elem mover = this.Head;
            while (mover != null)
            {
                if (mover.Info == info)
                    return;

                if (compareFunc(NewEl.Info, mover.Info)) {
                    NewEl.Next = mover;
                    NewEl.Prev = mover.Prev;
                    if (NewEl.Prev != null)
                        NewEl.Prev.Next = NewEl;
                    mover.Prev = NewEl;

                    if (NewEl.Next == this.Head)
                        this.Head = NewEl;
                    if (NewEl.Prev == this.Tail)
                        this.Tail = NewEl;


                    return;
                }

                mover = mover.Next;
            }

            this.Tail.Next = NewEl;
            NewEl.Prev = this.Tail;
            this.Tail = NewEl;
        }

        public void Remove(string info)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (String.Equals(mover.Info, info))
                {
                    if (mover == this.Head)
                        this.Head = mover.Next;
                    if (mover == this.Tail)
                        this.Tail = mover.Prev;

                    if (mover.Prev != null)
                    {
                        mover.Prev.Next = mover.Next;
                    }
                    if (mover.Next != null)
                    {
                        mover.Next.Prev = mover.Prev;
                    }

                    mover = null;
                    GC.Collect();
                    GC.WaitForPendingFinalizers();
                    break;
                }

                mover = mover.Next;
            }
        }

        public Elem Find(string info)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (String.Equals(mover.Info, info))
                    return mover;

                mover = mover.Next;
            }

            return null;
        }

        public void Print()
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                Console.WriteLine(mover.Info);
                mover = mover.Next;
            }
        }

        public void Clear()
        {
            this.Head = null;
            this.Tail = null;
            GC.Collect();
            GC.WaitForPendingFinalizers();
        }
    }

    class HashTable
    {
        public int Size { get; private set; }
        TwoLinkedList[] Table;

        public HashTable(int size)
        {
            this.Table = new TwoLinkedList[size];
            this.Size = size;
            for (int i = 0; i < size; i++)
            {
                this.Table[i] = new TwoLinkedList();
            }
        }

        private HashTable() { }

        private int HashFunction(string info)
        {
            int Hash = 0;
            for (int i = 0; i < info.Length; i++)
            {
                Hash += info[i];
            }

            return Hash % this.Size;
        }

        public void Add(string info)
        {
            int index = HashFunction(info);
            this.Table[index].Add(info);
        }

        public void Remove(string info)
        {
            int index = HashFunction(info);
            this.Table[index].Remove(info);
        }

        public void Print()
        {
            for(int i = 0; i < this.Size; i ++)
            {
                Console.WriteLine("========" + i.ToString() + "=============");
                this.Table[i].Print();
            }
        }

        public TwoLinkedList.Elem Find(string info)
        {
            int index = HashFunction(info);

            return this.Table[index].Find(info);
        }

        public void Clear()
        {
            for (int i = 0; i < this.Size; i++)
            {
                this.Table[i].Clear();
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {

            HashTable tbl = new HashTable(3);

            tbl.Add("юра привет");
            tbl.Add("a");
            tbl.Add("a");
            tbl.Add("b");
            tbl.Add("c");
            tbl.Add("fewf");
            tbl.Add("eryrty5r");
            tbl.Print();
            Console.WriteLine(tbl.Find("b"));
            Console.WriteLine(tbl.Find("Такого элемента нет(("));

            tbl.Clear();
            tbl.Print();
        }
    }
}
