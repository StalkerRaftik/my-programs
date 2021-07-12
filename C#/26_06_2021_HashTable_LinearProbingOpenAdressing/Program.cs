using System;

namespace _26_06_2021_HashTable_LinearProbingOpenAdressing
{
    public class PlayerInformation : ICloneable
    {
        public string Login { get; set; }
        public int Age { get; set; }

        public object Clone()
        {
            return new PlayerInformation { Login = this.Login, Age = this.Age };
        }
    }


    class HashLPOA // Linear Probing Open Adressing Hash
    {
        private uint _Size = 1;
        private PlayerInformation[] _Hash = new PlayerInformation[1];
        private bool[] _DeletedElementFlags = new bool[1];
        private uint _CountWithDeletedElements = 0;

        public uint Count { get; private set; } = 0;

        private void _ResizeHash(uint NewSize)
        {
            var OldHash = _Hash;
            var OldHSize = _Size;

            PlayerInformation[] NewHash = new PlayerInformation[NewSize];
            _Hash = NewHash;
            _Size = NewSize;
            _CountWithDeletedElements = Count;
            _DeletedElementFlags = new bool[NewSize];
            for (int i = 0; i < OldHSize; i++)
            {
                if (OldHash[i] != null)
                    Add(OldHash[i], true);
            }
        }

        private void _ResizeHashIfItsNecessary()
        {
            float FullnessRatio = (float)Count / (float)_Size;
            float FullnessRatioWithDeletedElements = (float)_CountWithDeletedElements / (float)_Size;

            if (FullnessRatioWithDeletedElements >= 0.7)
            {
                _ResizeHash(_Size*2);
            }
            else if (FullnessRatio <= 0.2)
            {
                _ResizeHash(_Size/2);
            }
        }

        // Метод деления
        private ulong HashFunction(string login)
        {
            const int p = 53;
            ulong Hash = 0, p_pow = 1;
            for (int i = 0; i < login.Length; i++)
            {
                Hash += login[i] * p_pow;
                p_pow *= p;
            }

            return Hash % _Size;
        }

        private ulong LinearProbing(ulong hash)
        {
            if (hash == _Size - 1)
                return 0;
            return ++hash;
        }

        public bool Add(PlayerInformation info)
        {
            ulong Key = HashFunction(info.Login);
            if (_Hash[Key] != null && _Hash[Key].Login == info.Login) // Эти данные уже есть в таблице
                return false;

            while (_Hash[Key] != null || _DeletedElementFlags[Key] == true)
            {
                Key = LinearProbing(Key);
                if (_Hash[Key] != null && _Hash[Key].Login == info.Login) // Эти данные уже есть в таблице
                    return false;
            }

            _Hash[Key] = info;
            _CountWithDeletedElements++;
            Count++;

            _ResizeHashIfItsNecessary();
            return true;
        }

        private bool Add(PlayerInformation info, bool internalAdditing = false)
        {
            ulong Key = HashFunction(info.Login);
            if (_Hash[Key] != null && _Hash[Key].Login == info.Login) // Эти данные уже есть в таблице
                return false;

            while (_Hash[Key] != null || _DeletedElementFlags[Key] == true)
            {
                Key = LinearProbing(Key);
                if (_Hash[Key] != null && _Hash[Key].Login == info.Login) // Эти данные уже есть в таблице
                    return false;
            }

            _Hash[Key] = info;

            if (!internalAdditing)
            {
                _ResizeHashIfItsNecessary();
                _CountWithDeletedElements++;
                Count++;
            }
            return true;
        }

        public bool Remove(PlayerInformation info)
        {
            ulong Key = HashFunction(info.Login);
            
            while(_Hash[Key].Age != info.Age && _Hash[Key].Login != info.Login)
            {
                if (_Hash[Key] == null && _DeletedElementFlags[Key] == false) return false;

                Key = LinearProbing(Key);
            }
            _Hash[Key] = null;
            _DeletedElementFlags[Key] = true;
            Count--;

            _ResizeHashIfItsNecessary();
            return true;
        }

        public PlayerInformation Find(PlayerInformation info)
        {
            ulong Key = HashFunction(info.Login);

            while (_Hash[Key].Age != info.Age && _Hash[Key].Login != info.Login)
            {
                if (_Hash[Key] == null && _DeletedElementFlags[Key] == false) return null;

                Key = LinearProbing(Key);
            }
            return _Hash[Key];
        }

        public string GetInfo()
        {
            string info = "";

            for(int i = 0; i < _Size; i++)
            {
                if (_Hash[i] != null)
                    info += i + ": " + _Hash[i].Login + " " + _Hash[i].Age + "\n";
            }

            info += "Total hash size: " + _Size;
            return info;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            HashLPOA hash = new HashLPOA();
            hash.Add(new PlayerInformation
            {
                Login = "qwerty123",
                Age = 13,
            });
            hash.Add(new PlayerInformation
            {
                Login = "qwerty1234",
                Age = 13,
            });
            hash.Add(new PlayerInformation
            {
                Login = "qwerty12345",
                Age = 13,
            });
            hash.Add(new PlayerInformation
            {
                Login = "qwerty123456",
                Age = 13,
            });
            Console.WriteLine(hash.GetInfo());
            hash.Remove(new PlayerInformation
            {
                Login = "qwerty123",
                Age = 13,
            });
            hash.Remove(new PlayerInformation
            {
                Login = "qwerty1234",
                Age = 13,
            });
            hash.Remove(new PlayerInformation
            {
                Login = "qwerty12345",
                Age = 13,
            });
            Console.WriteLine(hash.GetInfo());
        }
    }
}
