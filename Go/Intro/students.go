package main
import("fmt")

const (
    D, E = "d/dx", 2.718281828459045
    A int = 1
    COSTUME string = "Darth Vader"
)

func main() {
    var (
        student1 string = "John"
        student2 string = "Jane" // type is string
        x int = 2
    )

    y := 4 // type is inferred


    fmt.Println(student1)
    fmt.Println(student2)
    fmt.Println(x)
    fmt.Println(y)

    var a string
    var b int
    var c bool

    fmt.Println(a)
    fmt.Println(A)
    fmt.Println(b)
    fmt.Println(c)

    a = "blah"
    fmt.Println(a, D, E)

    fmt.Println(COSTUME)

    fmt.Printf(
        "I like %#v and it is a/n %T\nWe are at %v%%\n",
        E, E, E,
    )
    z := 255
    fmt.Printf("%b\n%+d\n%o\n%x\n%#x\n%-4d%4d\n",
                z,  z,   z,  z,  z,   z, z,
    )
}
