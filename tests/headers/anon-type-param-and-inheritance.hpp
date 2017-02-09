// bindgen-flags: -- -std=c++11
template <typename>
class Foo {
    int field;
};

template <typename T>
class PersistentRooted : Foo<PersistentRooted<T>> {};
