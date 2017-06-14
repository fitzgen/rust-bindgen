namespace JS {
namespace detail {
class a {};
template <class b> class CallArgsBase : b {
  int *c;
  unsigned d;
};
}
}
class B : JS::detail::CallArgsBase<JS::detail::a> {};
