/* automatically generated by rust-bindgen */


#![allow(non_snake_case)]


pub type __void_t = ::std::os::raw::c_void;
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct __iterator_traits<_Iterator, __anon_named_type_0> {
    pub _address: u8,
    pub _phantom_0: ::std::marker::PhantomData<_Iterator>,
    pub _phantom_1: ::std::marker::PhantomData<__anon_named_type_0>,
}
impl <_Iterator, __anon_named_type_0> Default for
 __iterator_traits<_Iterator, __anon_named_type_0> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
