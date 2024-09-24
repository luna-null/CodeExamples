
    pub fn vectors()
    {
        println!("\nVectors!!!\n");
        // Vectors
        let v: Vec<i32> = Vec::new();
        let mut u = vec![1, 2, 3];
        u.push(5);
        u.push(6);
        u.push(7);
        u.push(8);
        
        // Two ways to get an element of the vector
        // 1
        let third: &i32 = &u[2];
        println!("The third element of u is {third}");
        //2
        let third: Option<&i32> = u.get(2);
        match third {
            Some(third) => println!("The third element is {third}"),
            None => println!("There is no third element."),
        }
        // let does_not_exist = &u[100];
        // let does_not_exist2 = u.get(100);

        // Printing each element in a vector by iterating over its
        // elements in a for loop
        let mut w = vec![1, 2, 3, 4, 5];
        for i in &w {
            println!("{i}");
        }
        for i in &mut w {
            *i = 50;
        }
        // Vectors can store enums, which can store different types!
        enum SpreadsheetCell 
        {
            Int(i32),
            Float(f64),
            Text(String),
        }
        let row = vec!
        [
            SpreadsheetCell::Int(3),
            SpreadsheetCell::Text(String::from("blue")),
            SpreadsheetCell::Float(10.12),
        ];
        {
            let uv = vec![1, 2, 3, 4];
        } // no more uv :(


    }
