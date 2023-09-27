# Parte 1

def sum array
  return 0 if array.empty?  # Devuelve 0 si el arreglo está vacío
  array.reduce(:+)          # Suma los elementos del arreglo usando el método reduce
end

def max_2_sum array
  return 0 if array.empty?  # Devuelve 0 si el arreglo está vacío
  return array.first if array.length == 1  # Devuelve el único elemento si el arreglo tiene un elemento

  # Ordena el arreglo de forma descendente y suma los dos primeros elementos
  sorted_array = array.sort.reverse
  sorted_array[0] + sorted_array[1]
end

def sum_to_n? array,n
  return false if array.empty?  # Devuelve falso si el arreglo está vacío
  # Crea un hash para almacenar los elementos y sus índices
  element_to_index = {}
  # Itera sobre el arreglo
  array.each_with_index do |num, index|
    # Calcula el complemento necesario para sumar a n
    complement = n - num
    # Si el complemento existe en el hash y no es el mismo elemento
    if element_to_index.key?(complement) && element_to_index[complement] != index
      return true
    end
    # Almacena el elemento y su índice en el hash
    element_to_index[num] = index
  end
  return false  # Retorna falso si no se encontraron pares que sumen n
end

# Parte 2

def hello(name)
  "Hello, #{name}"
end

def starts_with_consonant?(s)
    return false if s.empty?
    s[0].match(/\A[^#aeiouAEIOU\s\d]/) ? true : false
end

def binary_multiple_of_4?(s)
  # Verifica si la cadena contiene solo 0s y 1s
  return false unless s.match?(/\A[01]+\z/)
  # Convierte la cadena binaria a un número entero en base 10
  binary_number = s.to_i(2)
  # Verifica si el número binario es múltiplo de 4
  binary_number % 4 == 0
end

# Parte 3

class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    raise ArgumentError, 'ISBN no puede estar vacío' if isbn.empty?
    raise ArgumentError, 'El precio debe ser mayor que cero' if price <= 0
    @isbn = isbn
    @price = price.to_f
  end
  def price_as_string
    format('$%.2f', @price) # Formatea el precio con dos decimales y un signo de dólar inicial
  end
end
