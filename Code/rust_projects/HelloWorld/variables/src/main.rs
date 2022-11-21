fn main() {
    let mut x : u32 = 5;
    println!("X: {x}");
    x = 6;
    println!("X: {x}");


    let y = 5;
    let y = y + 1;
    {
        let y = y * 2;
        println!("The value of y inside the scope is {y}");
    }
    println!("The value of y outside of the scope is {y}");


    println!("--------------------------------------");
    //There is multiple variable types, this being divided into Scalar and Compound
        // Scalar is basically: Integers, Floating-Point, Booleans and Charachters
            //Integers
                // u - unsigned (no negative numbers) and s - signed (can be positive and negative)
                // x8, x16, x32, x64, x128, xsize. Each type can have numbers from 2^-n to 2^n - 1 (assuming it is signed for negative)
                    // The size one refers to the architecture of the operating system, 32-bit, 64-bit for example
                // The default type is i32, Rust also supports number literals (98_222 - Dec, 0xff - Hex, 0o77 - Oct, 0b1111_0000 - Bin, b'A' - Byte
                let y: u8 = 2;

            // Floating point type
                // There are two types of floats, f32 and f64 (the number representing bits)
                // The performance between the two are primarily the same now, because of that f64 is the default
                let a: f32 = 2.0;

            // Booleans
                // Like any other programming langauge, Rust has True and False as booleans
                let t = True;
                let f: bool = False;

            // Numeric operations
                
}
