// bindgen-flags: --enable-cxx-namespaces -- --std=c++14
template <typename> struct a {};
template <typename T> using b = a<T>;
template <typename T> class Rooted { b<T> c; };
