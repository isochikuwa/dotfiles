```
use std::os::raw::c_char;
use std::ffi::{CStr, CString};

type Callback = fn(*const c_char) -> isize;

#[no_mangle]
pub extern "C" fn search_max_width_index(callback: Callback, text: *const c_char, max_width: isize) -> isize {
    println!("called rust function");
    //let text = unsafe { CStr::from_ptr(text).to_string_lossy().into_owned() };
    let text = unsafe { CStr::from_ptr(text).to_str().unwrap() };
    dbg!(text);
    let mut l = 0;
    let mut r = text.len() as isize;
    let mut i = (l + r) / 2;
    while l <= r {
        let tmp = CString::new((&text[..i as usize]).to_string()).unwrap();
        let width = callback(tmp.as_ptr() as *const c_char);
        dbg!(width);
        if width == max_width {
            return i;
        } else if width < max_width {
            l = i + 1;
        } else {
            r = i - 1;
        }
        i = (l + r) / 2;
        dbg!(i);
    }
    i
}
```
