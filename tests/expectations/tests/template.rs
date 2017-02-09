/* automatically generated by rust-bindgen */


#![allow(non_snake_case)]


#[repr(C)]
#[derive(Debug)]
pub struct Foo<T, U> {
    pub m_member: T,
    pub m_member_ptr: *mut T,
    pub m_member_arr: [T; 1usize],
    pub _phantom_0: ::std::marker::PhantomData<T>,
    pub _phantom_1: ::std::marker::PhantomData<U>,
}
impl <T, U> Default for Foo<T, U> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
extern "C" {
    #[link_name = "_Z3bar3FooIiiE"]
    pub fn bar(foo: Foo<::std::os::raw::c_int, ::std::os::raw::c_int>);
}
#[repr(C)]
#[derive(Debug)]
pub struct D<T> {
    pub m_foo: D_MyFoo,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
pub type D_MyFoo = Foo<::std::os::raw::c_int, ::std::os::raw::c_int>;
#[repr(C)]
#[derive(Debug)]
pub struct D_U<T, Z> {
    pub m_nested_foo: D_MyFoo,
    pub m_baz: Z,
    pub _phantom_0: ::std::marker::PhantomData<T>,
    pub _phantom_1: ::std::marker::PhantomData<Z>,
}
impl <T, Z> Default for D_U<T, Z> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
impl <T> Default for D<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Rooted<T> {
    pub prev: *mut T,
    pub next: *mut Rooted<*mut ::std::os::raw::c_void>,
    pub ptr: T,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for Rooted<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Copy)]
pub struct RootedContainer {
    pub root: Rooted<*mut ::std::os::raw::c_void>,
}
#[test]
fn bindgen_test_layout_RootedContainer() {
    assert_eq!(::std::mem::size_of::<RootedContainer>() , 24usize , concat ! (
               "Size of: " , stringify ! ( RootedContainer ) ));
    assert_eq! (::std::mem::align_of::<RootedContainer>() , 8usize , concat !
                ( "Alignment of " , stringify ! ( RootedContainer ) ));
    assert_eq! (unsafe {
                & ( * ( 0 as * const RootedContainer ) ) . root as * const _
                as usize } , 0usize , concat ! (
                "Alignment of field: " , stringify ! ( RootedContainer ) ,
                "::" , stringify ! ( root ) ));
}
impl Clone for RootedContainer {
    fn clone(&self) -> Self { *self }
}
impl Default for RootedContainer {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug)]
pub struct WithDtor<T> {
    pub member: T,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for WithDtor<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
pub type WithDtorIntFwd = WithDtor<::std::os::raw::c_int>;
#[repr(C)]
#[derive(Debug)]
pub struct PODButContainsDtor {
    pub member: WithDtorIntFwd,
}
#[test]
fn bindgen_test_layout_PODButContainsDtor() {
    assert_eq!(::std::mem::size_of::<PODButContainsDtor>() , 4usize , concat !
               ( "Size of: " , stringify ! ( PODButContainsDtor ) ));
    assert_eq! (::std::mem::align_of::<PODButContainsDtor>() , 4usize , concat
                ! ( "Alignment of " , stringify ! ( PODButContainsDtor ) ));
    assert_eq! (unsafe {
                & ( * ( 0 as * const PODButContainsDtor ) ) . member as *
                const _ as usize } , 0usize , concat ! (
                "Alignment of field: " , stringify ! ( PODButContainsDtor ) ,
                "::" , stringify ! ( member ) ));
}
impl Default for PODButContainsDtor {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
/** <div rustbindgen opaque> */
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Opaque<T> {
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for Opaque<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Default, Copy)]
pub struct POD {
    pub opaque_member: u32,
}
#[test]
fn bindgen_test_layout_POD() {
    assert_eq!(::std::mem::size_of::<POD>() , 4usize , concat ! (
               "Size of: " , stringify ! ( POD ) ));
    assert_eq! (::std::mem::align_of::<POD>() , 4usize , concat ! (
                "Alignment of " , stringify ! ( POD ) ));
    assert_eq! (unsafe {
                & ( * ( 0 as * const POD ) ) . opaque_member as * const _ as
                usize } , 0usize , concat ! (
                "Alignment of field: " , stringify ! ( POD ) , "::" ,
                stringify ! ( opaque_member ) ));
}
impl Clone for POD {
    fn clone(&self) -> Self { *self }
}
/**
 * <div rustbindgen replaces="NestedReplaced"></div>
 */
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct NestedReplaced<T> {
    pub buff: *mut T,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for NestedReplaced<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct NestedBase<T, U> {
    pub buff: *mut T,
    pub _phantom_0: ::std::marker::PhantomData<T>,
    pub _phantom_1: ::std::marker::PhantomData<U>,
}
impl <T, U> Default for NestedBase<T, U> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Incomplete<T> {
    pub d: T,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for Incomplete<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct NestedContainer<T> {
    pub c: T,
    pub nested: NestedReplaced<T>,
    pub inc: Incomplete<T>,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for NestedContainer<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Default, Copy)]
pub struct Untemplated {
    pub _address: u8,
}
#[test]
fn bindgen_test_layout_Untemplated() {
    assert_eq!(::std::mem::size_of::<Untemplated>() , 1usize , concat ! (
               "Size of: " , stringify ! ( Untemplated ) ));
    assert_eq! (::std::mem::align_of::<Untemplated>() , 1usize , concat ! (
                "Alignment of " , stringify ! ( Untemplated ) ));
}
impl Clone for Untemplated {
    fn clone(&self) -> Self { *self }
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct Templated<T> {
    pub m_untemplated: Untemplated,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for Templated<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
/**
 * If the replacement doesn't happen at the parse level the container would be
 * copy and the replacement wouldn't, so this wouldn't compile.
 *
 * <div rustbindgen replaces="ReplacedWithoutDestructor"></div>
 */
#[repr(C)]
#[derive(Debug)]
pub struct ReplacedWithoutDestructor<T> {
    pub buff: *mut T,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for ReplacedWithoutDestructor<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug)]
pub struct ShouldNotBeCopiable<T> {
    pub m_member: ReplacedWithoutDestructor<T>,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for ShouldNotBeCopiable<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug)]
pub struct ShouldNotBeCopiableAsWell<U> {
    pub m_member: ReplacedWithoutDestructorFwd<U>,
    pub _phantom_0: ::std::marker::PhantomData<U>,
}
impl <U> Default for ShouldNotBeCopiableAsWell<U> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
/**
 * If the replacement doesn't happen at the parse level the container would be
 * copy and the replacement wouldn't, so this wouldn't compile.
 *
 * <div rustbindgen replaces="ReplacedWithoutDestructorFwd"></div>
 */
#[repr(C)]
#[derive(Debug)]
pub struct ReplacedWithoutDestructorFwd<T> {
    pub buff: *mut T,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for ReplacedWithoutDestructorFwd<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct TemplateWithVar<T> {
    pub _address: u8,
    pub _phantom_0: ::std::marker::PhantomData<T>,
}
impl <T> Default for TemplateWithVar<T> {
    fn default() -> Self { unsafe { ::std::mem::zeroed() } }
}
#[test]
fn __bindgen_test_layout_template_1() {
    assert_eq!(::std::mem::size_of::<Foo<::std::os::raw::c_int, ::std::os::raw::c_int>>()
               , 24usize , concat ! (
               "Size of template specialization: " , stringify ! (
               Foo<::std::os::raw::c_int, ::std::os::raw::c_int> ) ));
    assert_eq!(::std::mem::align_of::<Foo<::std::os::raw::c_int, ::std::os::raw::c_int>>()
               , 8usize , concat ! (
               "Alignment of template specialization: " , stringify ! (
               Foo<::std::os::raw::c_int, ::std::os::raw::c_int> ) ));
}
#[test]
fn __bindgen_test_layout_template_2() {
    assert_eq!(::std::mem::size_of::<Rooted<*mut ::std::os::raw::c_void>>() ,
               24usize , concat ! (
               "Size of template specialization: " , stringify ! (
               Rooted<*mut ::std::os::raw::c_void> ) ));
    assert_eq!(::std::mem::align_of::<Rooted<*mut ::std::os::raw::c_void>>() ,
               8usize , concat ! (
               "Alignment of template specialization: " , stringify ! (
               Rooted<*mut ::std::os::raw::c_void> ) ));
}
#[test]
fn __bindgen_test_layout_template_3() {
    assert_eq!(::std::mem::size_of::<WithDtor<::std::os::raw::c_int>>() ,
               4usize , concat ! (
               "Size of template specialization: " , stringify ! (
               WithDtor<::std::os::raw::c_int> ) ));
    assert_eq!(::std::mem::align_of::<WithDtor<::std::os::raw::c_int>>() ,
               4usize , concat ! (
               "Alignment of template specialization: " , stringify ! (
               WithDtor<::std::os::raw::c_int> ) ));
}
