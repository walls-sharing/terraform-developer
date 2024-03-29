# Variable Types

### Primitives
1. Any (arbitrary type)
```js
variable "an_any" {
  type    = any
  default = null
}
```

2. String
```js
variable "a_string" {
  type    = string
  default = "hello"
}
```

3. Number
```js
variable "a_number" {
  type    = number
  default = 123.45
}
```

4. Boolean
```js
variable "a_bool" {
  type    = bool
  default = true
}
```

### List, Set, Tuple
1. List, Set
```js
variable "a_list" {
  type    = list(string)
  default = ["red", "green", "red"]
}

variable "a_set" {
  type    = set(string)
  default = ["red", "green", "red"] // becomes ["red", "green"] at runtime
}
```

2. Tuple
```js
variable "a_tuple" {
  type    = tuple([string, number, bool])
  default = ["cat", 1, true]
}
```

### Map, Object
1. Map
```js
variable "a_map" {
  type    = map
  default = { name = "Tee", age = 25 }
}
```

2. Object
```js

variable "a_object" {
  type    = object({ name = string, age = optional(number) })
  default = { name = "Tee", age = "25" }
}

variable "a_object_complex_example" {
  type = object({
    name = string,
    vehicles = list(object({ idx = number, item = string }))
  })
  default = {
    name = "Tee",
    vehicles = [
      { idx = 1, item = "car" },
      { idx = 2, item = "yatch" }
    ]
  }
}

```
