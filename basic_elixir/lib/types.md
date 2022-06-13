# Types

Em Elixir temos tipagem dinamica, significando que não precisamos
definir o tipo de nossas variaveis

- Inteiros -- **1, 2, 3, 4, ...**
- Números Flutuantes -- **1.5, 2.3, 593.3, ...**
- Booleanos -- **true / false**
- Strings -- **"Olá Elixir", "Olá Mundo"**
- Atom -- **:ok, :error** / Podemos dizer que se trata de uma String constante (similar ao symbols do ruby)

Devido a ser tipagem dinamica temos métodos para verificar os tipos, como por exemplo:

- `is_integer()` -> Recebe um valor e retorna se é um **inteiro** ou não

  > is_integer(1) // true
  > is_integer(2.2) // false
  > is_integer("ola") // false

- `is_float()` -> Recebe um valor e retorna se é um **número flutuante** ou não

  > is_float(1.5) // true
  > is_float(2) // false
  > is_float("ola") // false

- `is_boolean()` -> Recebe um valor e retorna se é um **booleano** ou não

  > is_bool(true) // true
  > is_bool(false) // true
  > is_bool(1) // false
  > is_bool("ola") // false

- `is_atom()` -> Recebe um valor e retorna se é um **atom** ou não
  > is_atom(:ok) // true
  > is_atom(:banana) // true
  > is_atom(:error) // true
  > is_atom(1) // false
  > is_atom("ola") // false
  > is_atom(1.2) // false
