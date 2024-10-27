use std::f32::consts::PI;
use std::io::{self, Write};
use std::thread::sleep;
use std::time::Duration;

fn calculate_x(i: f32, j: f32, k: f32, a: f32, b: f32, c: f32) -> f32 {
    j * a.sin() * b.sin() * c.cos()
        - k * a.cos() * b.sin() * c.cos()
        + j * a.cos() * c.sin()
        + k * a.sin() * c.sin()
        + i * b.cos() * c.cos()
}

fn calculate_y(i: f32, j: f32, k: f32, a: f32, b: f32, c: f32) -> f32 {
    j * a.cos() * c.cos()
        + k * a.sin() * c.cos()
        - j * a.sin() * b.sin() * c.sin()
        + k * a.cos() * b.sin() * c.sin()
        - i * b.cos() * c.sin()
}

fn calculate_z(i: f32, j: f32, k: f32, a: f32, b: f32, _c: f32) -> f32 {
    k * a.cos() * b.cos() - j * a.sin() * b.cos() + i * b.sin()
}

fn calculate_for_surface(
    cube_x: f32,
    cube_y: f32,
    cube_z: f32,
    ch: char,
    buffer: &mut Vec<char>,
    z_buffer: &mut Vec<f32>,
    width: usize,
    height: usize,
    a: f32,
    b: f32,
    c: f32,
    cube_width: f32,
    k1: f32,
    distance_from_cam: f32,
) {
    let x = calculate_x(cube_x, cube_y, cube_z, a, b, c);
    let y = calculate_y(cube_x, cube_y, cube_z, a, b, c);
    let z = calculate_z(cube_x, cube_y, cube_z, a, b, c) + distance_from_cam;

    let ooz = 1.0 / z;
    let xp = (width as f32 / 2.0 - 2.0 * cube_width + k1 * ooz * x * 2.0) as isize;
    let yp = (height as f32 / 2.0 + k1 * ooz * y * 2.0) as isize;

    let idx = (xp + yp * width as isize) as usize;
    if idx < width * height && ooz > z_buffer[idx] {
        z_buffer[idx] = ooz;
        buffer[idx] = ch;
    }
}

fn main() {
    let mut a = 0.0;
    let mut b = 0.0;
    let c = 0.0;

    let cube_width = 10.0;
    let width = 80;
    let height = 33;
    let distance_from_cam = 100.0;
    let k1 = 40.0;
    let increment_speed = 0.6;

    let mut buffer = vec![' '; width * height];
    let mut z_buffer = vec![0.0; width * height];

    // clear the terminal
    print!("\x1b[2J");

    loop {
        buffer.fill(' ');
        z_buffer.fill(0.0);

        for cube_x in (-cube_width as isize..cube_width as isize).map(|x| x as f32 * increment_speed) {
            for cube_y in (-cube_width as isize..cube_width as isize).map(|y| y as f32 * increment_speed) {
                calculate_for_surface(cube_x, cube_y, -cube_width, '.', &mut buffer, &mut z_buffer, width, height, a, b, c, cube_width, k1, distance_from_cam);
                calculate_for_surface(cube_width, cube_y, cube_x, '$', &mut buffer, &mut z_buffer, width, height, a, b, c, cube_width, k1, distance_from_cam);
                calculate_for_surface(-cube_width, cube_y, -cube_x, '~', &mut buffer, &mut z_buffer, width, height, a, b, c, cube_width, k1, distance_from_cam);
                calculate_for_surface(-cube_x, cube_y, cube_width, '#', &mut buffer, &mut z_buffer, width, height, a, b, c, cube_width, k1, distance_from_cam);
                calculate_for_surface(cube_x, -cube_width, -cube_y, ';', &mut buffer, &mut z_buffer, width, height, a, b, c, cube_width, k1, distance_from_cam);
                calculate_for_surface(cube_x, cube_width, cube_y, '+', &mut buffer, &mut z_buffer, width, height, a, b, c, cube_width, k1, distance_from_cam);
            }
        }

        print!("\x1b[H"); // move the cursor to the top-left corner
        io::stdout().flush().unwrap();

        for k in 0..width * height {
            if k % width == 0 {
                print!("\n");
            } else {
                print!("{}", buffer[k]);
            }
        }

        a += 0.05;
        b += 0.05;

        sleep(Duration::from_millis(12));
    }
}

