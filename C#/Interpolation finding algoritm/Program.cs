using System;
using System.Collections.Generic;
namespace Interpolation_finding_algoritm
{
    class Program
    {   
        // Структура элементов в выходных данных поиска
        struct Result 
        {
            public int i;
            public int j;
            public int steps; 
        }


        private static int WIDTH = 10;
        private static int HEIGHT = 8;


        // Алгоритм быстрой сортировка
        // Формальные и входные параметры - ссылка на массив, на сортируемую строку и на размер строки
        // Выходные данные - нет
        private static void QuickSort(ref int[,] arr, int i, int size)
        {
            int start = 0;
            int end = size - 1;
            List<Tuple<int, int>> stck = new List<Tuple<int, int>>();

            int l, r, s, e;
            stck.Add(Tuple.Create(start, end));

            int pivot; // Опорный эл.
            while (stck.Count != 0)
            {
                l = s = stck[stck.Count-1].Item1;
                r = e = stck[stck.Count-1].Item2;
                pivot = (arr[i,l] + arr[i, r] + arr[i, (l+r)/2]) / 3;
                stck.RemoveAt(stck.Count - 1);
                while (l <= r)
                {
                    while (arr[i,l] < pivot)
                    {
                        l++;
                    }
                    while (arr[i,r] > pivot)
                    {
                        r--;
                    }
                    if (l <= r)
                    {
                        int buff = arr[i,l];
                        arr[i, l] = arr[i, r];
                        arr[i, r] = buff;
                        r--;
                        l++;
                    }
                }
                if (s < r)
                {
                    stck.Add(Tuple.Create(s, r));
                }
                if (l < e)
                {
                    stck.Add(Tuple.Create(l, e));
                }
            }
        }

        // Алгоритм интерполяционного поиска
        // Формальные и входные параметры - двумерный массив, искомое значение
        // Выходные данные - лист с результатом поиска
        private static List<Result> InterpolFind(int[,] arr, int value)
        {
            List<Result> result = new List<Result>();
            int mid;
            int low;
            int high;
            
            for (int i = 0; i < HEIGHT; i++)
            {
                Stack<Tuple<int, int>> stck = new Stack<Tuple<int, int>>();
                stck.Push(Tuple.Create(0, WIDTH - 1));
                int stps = 0;
                while (stck.Count != 0)
                {
                    Tuple<int, int> bords = stck.Pop();
                    low = bords.Item1;
                    high = bords.Item2;
                    if (low > high) continue;
                    var done = false;

                    stps++;
                    while (arr[i, low] < value && value < arr[i, high])
                    {
                        stps++;
                        if (arr[i, high] == arr[i, low]) break;

                        mid = low + ((value - arr[i, low]) * (high - low) / (arr[i, high] - arr[i, low]));

                        if (arr[i, mid] < value) low = mid + 1;
                        else if (arr[i, mid] > value) high = mid - 1;
                        else
                        {
                            Result data = new Result();
                            data.i = i;
                            data.j = mid;
                            data.steps = stps;
                            result.Add(data);
                            stck.Push(Tuple.Create(bords.Item1, mid - 1));
                            stck.Push(Tuple.Create(mid + 1, bords.Item2));
                            done = true;
                            break;
                        }
                    }
                    if (done) continue;

                    if (arr[i, low] == value)
                    {
                        Result data = new Result();
                        data.i = i;
                        data.j = low;
                        data.steps = stps;
                        result.Add(data);
                        stck.Push(Tuple.Create(bords.Item1, low-1));
                        stck.Push(Tuple.Create(low + 1, bords.Item2));
                    }
                    else if (arr[i, high] == value)
                    {
                        Result data = new Result();
                        data.i = i;
                        data.j = high;
                        data.steps = stps;
                        result.Add(data);
                        stck.Push(Tuple.Create(bords.Item1, high - 1));
                        stck.Push(Tuple.Create(high + 1, bords.Item2));
                    }
                }
            }

            return result;
        }

        static void Main(string[] args)
        {
            var rand = new Random();

            
            int[,] arr = new int[HEIGHT, WIDTH];
            var input = -1;
            while (input != 5)
            {
                Console.WriteLine("1 - заранее заданный отсортированный массив с повторениями\n2 - рандомный, затем отсортированный\n3 - с одинаковыми числами\n4 - текущий(если есть)\n5 - завершить программу");
                input = Convert.ToInt32(Console.ReadLine());
                if (input == 1)
                {
                    for (int i = 0; i < HEIGHT; i++)
                    {
                        var num = 0;
                        for (int j = 0; j < WIDTH; j++)
                        {
                            var chance = rand.Next(2);
                            if (chance == 1)
                            {
                                num = num + rand.Next(31);
                            }
                            arr[i, j] = num;
                            Console.Write(arr[i, j] + " ");
                        }
                        Console.WriteLine();
                    }
                    Console.WriteLine("--------------------------------------");
                }
                else if (input == 2)
                {
                    for (int i = 0; i < HEIGHT; i++)
                    {
                        for (int j = 0; j < WIDTH; j++)
                        {
                            arr[i, j] = rand.Next(31);
                            Console.Write(arr[i, j] + " ");
                        }
                        Console.WriteLine();
                    }
                    Console.WriteLine("--------------------------------------");
                    for (int i = 0; i < HEIGHT; i++)
                    {
                        QuickSort(ref arr, i, WIDTH);
                        for (int j = 0; j < WIDTH; j++)
                        {
                            Console.Write(arr[i, j] + " ");
                        }
                        Console.WriteLine();
                    }
                    Console.WriteLine("--------------------------------------");
                }
                else if (input == 3)
                {
                    for (int i = 0; i < HEIGHT; i++)
                    {
                        for (int j = 0; j < WIDTH; j++)
                        {
                            arr[i, j] = 10;
                            Console.Write(arr[i, j] + " ");
                        }
                        Console.WriteLine();
                    }
                    Console.WriteLine("--------------------------------------");
                }
                else if (input == 5) break;

                Console.WriteLine("Введите необходимое в поиске число");
                input = Convert.ToInt32(Console.ReadLine());

                List<Result> result = InterpolFind(arr, input);
                Console.WriteLine("Результат:");
                foreach (Result i in result)
                {
                    Console.WriteLine(i.i + " " + i.j + " steps: " + i.steps);
                }
                if (result.Count == 0)
                {
                    Console.WriteLine("Элементов в массиве нет.");
                }
            }
        }
    }
}
