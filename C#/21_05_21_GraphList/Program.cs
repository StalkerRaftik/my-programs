using System;
using System.Collections.Generic;
using System.IO;

namespace _21_05_21_GraphList
{
    class TwoLinkedList
    {
        public class Elem
        {
            public Elem Prev; // Previous
            public Elem Next; // Next
            public int Node;
            public int Weight;
        }

        public Elem Head;
        public Elem Tail;
        public int Count { get; private set; }

        public void Add(int node, int weight)
        {
            Elem NewEl = new Elem();
            NewEl.Node = node;
            NewEl.Weight = weight;

            if (this.Head == null)
            {
                this.Head = NewEl;
                this.Tail = NewEl;
            }
            else
            {
                this.Tail.Next = NewEl;
                NewEl.Prev = this.Tail;
                this.Tail = NewEl;
            }
            this.Count++;
        }

        public void Remove(int node, int weight)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (mover.Node == node && mover.Weight == weight)
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
                    this.Count--;
                    break;
                }

                mover = mover.Next;
            }
        }

        public Elem FindByNode(int node)
        {
            Elem mover = this.Head;

            while (mover != null)
            {
                if (mover.Node == node)
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
                Console.WriteLine(mover.Node.ToString() + " " + mover.Weight.ToString());
                mover = mover.Next;
            }
        }
    }

    class OrientedGraph
    {
        public Dictionary<int, TwoLinkedList> List = new Dictionary<int, TwoLinkedList>();

        public void AddVerge(int from, int to, int weight)
        {
            if (!this.List.ContainsKey(from))
            {
                this.List.Add(from, new TwoLinkedList());
            }

            this.List[from].Add(to, weight);

            if (!this.List.ContainsKey(to))
                this.AddNode(to);
        }

        public void RemoveVerge(int from, int to, int weight)
        {
            if (!this.List.ContainsKey(from)) return;

            this.List[from].Remove(to, weight);
        }

        public void PrintVerges()
        {
            foreach (KeyValuePair<int, TwoLinkedList> pair in this.List)
            {
                TwoLinkedList List = pair.Value;
                if (List == null) return;

                TwoLinkedList.Elem mover = List.Head;
                while (mover != null)
                {
                    Console.WriteLine((pair.Key).ToString() + "---->" + (mover.Node).ToString() + " " + mover.Weight.ToString());

                    mover = mover.Next;
                }
            }
        }

        public void AddNode(int node)
        {
            if (this.List.ContainsKey(node)) return;
            this.List.Add(node, new TwoLinkedList());
        }

        public void RemoveNode(int node)
        {
            if (this.List.ContainsKey(node))
                this.List.Remove(node);

            foreach(KeyValuePair<int, TwoLinkedList> pair in this.List)
            {
                TwoLinkedList tll = pair.Value;
                TwoLinkedList.Elem mover = tll.Head;
                
                while (mover != null)
                {
                    if (mover.Node == node)
                        tll.Remove(mover.Node, mover.Weight);

                    mover = mover.Next;
                }
            }
        }

        Dictionary<int, bool> VergeVisited = new Dictionary<int, bool>();
        public void PrintDFS(int from)
        {
            this.VergeVisited.Clear();
            this.VergeVisited.Add(from, true);
            if (!this.List.ContainsKey(from)) return;
            
            PrintDFSHidden(from);
        }

        // Первый вызов очищает массив посещенных вершин.
        private void PrintDFSHidden(int el)
        {
            if (!this.List.ContainsKey(el)) return;

            TwoLinkedList List = this.List[el];

            TwoLinkedList.Elem mover = List.Head;
            while (mover != null)
            {
                if (!this.VergeVisited.ContainsKey(mover.Node))
                {
                    Console.WriteLine((el).ToString() + "---->" + (mover.Node).ToString() + " " + mover.Weight.ToString());
                    this.VergeVisited.Add(mover.Node, true);
                    PrintDFSHidden(mover.Node);
                }

                mover = mover.Next;
            }

        }

        public void FloydMinPathMatrix()
        {
            Dictionary<int, Dictionary<int, int>> Matrix = new Dictionary<int, Dictionary<int, int>>();

            // Собираем изначальную матрицу смежности с минимальными весами.
            foreach (KeyValuePair<int, TwoLinkedList> pair in this.List)
            {
                int CurNode = pair.Key;
                if (!Matrix.ContainsKey(CurNode))
                    Matrix.Add(CurNode, new Dictionary<int, int>());

                // Если сам в себя - путь равен нулю
                if (!Matrix[CurNode].ContainsKey(CurNode))
                    Matrix[CurNode].Add(CurNode, 0);

                TwoLinkedList tll = pair.Value;
                TwoLinkedList.Elem mover = tll.Head;
                while (mover != null)
                {
                    // Если сам в себя - путь равен нулю
                    if (CurNode == mover.Node)
                    {
                        if (!Matrix[CurNode].ContainsKey(CurNode))
                            Matrix[CurNode].Add(CurNode, 0);
                        continue;
                    }

                    else if (!Matrix[CurNode].ContainsKey(mover.Node))
                        Matrix[CurNode].Add(mover.Node, mover.Weight);
                    else if (Matrix[CurNode][mover.Node] > mover.Weight)
                        Matrix[CurNode][mover.Node] = mover.Weight;

                    // Если мой граф работает идеально - это условие не требуется(99.9% что не требуется).
                    // Но пусть будет, на всякий случай. ЧФ - человеческий фактор
                    if (!Matrix.ContainsKey(mover.Node))
                        Matrix.Add(mover.Node, new Dictionary<int, int>());

                    mover = mover.Next;
                }
            }

            // Сам алгоритм Флойда - Уоршелла
            foreach (KeyValuePair<int, Dictionary<int, int>> _K in Matrix)
            {
                int k = _K.Key;
                foreach (KeyValuePair<int, Dictionary<int, int>> _I in Matrix)
                {
                    int i = _I.Key;
                    foreach (KeyValuePair<int, Dictionary<int, int>> _J in Matrix)
                    {
                        int j = _J.Key;

                        long CurWeight = GetWeight(i,j);
                        long PotentialWeight = (long)GetWeight(i, k) + (long)GetWeight(k, j);
                        if (PotentialWeight < CurWeight)
                        {
                            if (!Matrix[i].ContainsKey(j) && PotentialWeight <= Int32.MaxValue)
                                Matrix[i].Add(j, (int)PotentialWeight);
                            else
                                Matrix[i][j] = (int)PotentialWeight;
                        }
                    }
                }
            }

            

            // Вывод результатов
            string str = "  ";
            foreach (KeyValuePair<int, Dictionary<int, int>> _I in Matrix)
            {
                int i = _I.Key;
                str += i + "   ";
            }
            Console.WriteLine(str);

            foreach (KeyValuePair<int, Dictionary<int, int>> _J in Matrix)
            {
                int j = _J.Key;

                str = j + " ";
                foreach (KeyValuePair<int, Dictionary<int, int>> _I in Matrix)
                {
                    int i = _I.Key;

                    if (Matrix[i].ContainsKey(j))
                        str += Matrix[i][j] + "   ";
                    else
                        str += "inf ";

                }
                Console.WriteLine(str);
            }

            // Вспомогательная функция
            int GetWeight(int from, int to)
            {
                if (Matrix[from].ContainsKey(to))
                    return Matrix[from][to];

                return Int32.MaxValue;
            }
        }
    }


    class Program
    {
        static int CheckBorders(int info, int from, int to)
        {
            while (true)
            {
                if (info < from || info > to)
                {
                    Console.WriteLine("Вы ввели некорректное значение! Введите значение от " + from + " до " + to + "!");
                    info = Int32.Parse(Console.ReadLine());
                }
                else return info;
            }

        }

        static void Main(string[] args)
        {
            Console.WriteLine("Выберите тип создания графа: ");
            Console.WriteLine("1 - новый");
            Console.WriteLine("2 - считать с graph.gph");
            int nCount = CheckBorders(Int32.Parse(Console.ReadLine()), 1, 2);
            OrientedGraph g = null;
            switch (nCount)
            {
                case 1:
                    g = new OrientedGraph();
                    break;
                case 2:
                    string path = @"C:\Important\Studying\my-programs\C#\17_05_21_Graph\graph.gph";

                    using (StreamReader sr = new StreamReader(path, System.Text.Encoding.Default))
                    {
                        string line = sr.ReadLine();
                        nCount = Int32.Parse(line);
                        g = new OrientedGraph();

                        Dictionary<int, bool> NodesAdded = new Dictionary<int, bool>();
                        int nodecounter = 0;
                        while ((line = sr.ReadLine()) != null)
                        {
                            string[] subs = line.Split(" ");
                            int from = Int32.Parse(subs[0]);
                            
                            if (!NodesAdded.ContainsKey(from))
                            {
                                NodesAdded.Add(from, true);
                                g.AddNode(from);
                                nodecounter++;

                                for (int i = 1; i + 1 < subs.Length; i += 2)
                                {
                                    g.AddVerge(from, Int32.Parse(subs[i]), Int32.Parse(subs[i + 1]));
                                }
                            }
                        }

                        if (nodecounter != nCount)
                        {
                            Console.WriteLine("Указано неверное количество вершин! Программа завершается!");
                            return;
                        }
                    }

                    break;
            }


            int menuInt = -1;
            while (menuInt != 0)
            {
                Console.WriteLine("Меню:");
                Console.WriteLine("1 - добавить путь");
                Console.WriteLine("2 - удалить путь");
                Console.WriteLine("3 - вывести таблицу путей");
                Console.WriteLine("4 - обход в глубину");
                Console.WriteLine("5 - добавить узел");
                Console.WriteLine("6 - удалить узел(включая пути с этим узлом)");
                Console.WriteLine("7 - алгоритм Флойда");
                // Кратчайший путь из всех во все. Даша агапова флойда оршелла алгоритм
                Console.WriteLine("0 - завершить программу");
                menuInt = Int32.Parse(Console.ReadLine());
                int input1;
                int input2;
                int input3;
                switch (menuInt)
                {
                    case 1:
                        Console.Write("Из узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        Console.Write("В узел: ");
                        input2 = Int32.Parse(Console.ReadLine());
                        Console.Write("Вес пути: ");
                        input3 = Int32.Parse(Console.ReadLine());



                        g.AddVerge(input1, input2, input3);
                        break;
                    case 2:
                        Console.Write("Из узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        Console.Write("В узел: ");
                        input2 = Int32.Parse(Console.ReadLine());
                        Console.Write("Вес пути: ");
                        input3 = Int32.Parse(Console.ReadLine());

                        g.RemoveVerge(input1, input2, input3);
                        break;
                    case 3:
                        g.PrintVerges();
                        break;
                    case 4:
                        Console.Write("Из узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        g.PrintDFS(input1);
                        break;
                    case 5:
                        Console.Write("Номер узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        g.AddNode(input1);

                        break;
                    case 6:
                        Console.Write("Номер узла: ");
                        input1 = Int32.Parse(Console.ReadLine());
                        g.RemoveNode(input1);

                        break;
                    case 7:
                        g.FloydMinPathMatrix();
                        break;
                }
            }

        }
    }
    }
