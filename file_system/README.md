# FileSystem

## Usage
```ruby
require './node.rb'

node = Node.new('./test/folder')
node.children
# => [
#   #<Node:0x00000001bc3c38 @path="./test/folder/file_2.txt">,
#   #<Node:0x00000001bc12a8 @path="./test/folder/folder">,
#   #<Node:0x00000001bc1370 @path="./test/folder/file.txt">
# ]

puts node
# =>  folder | 30KB
#         file_2.txt | 5KB
#         file.txt | 10KB
#         folder | 15KB
#             file_2.txt | 5KB
#             file.txt | 10KB
```

## Testing

```
$ ruby test/file_node_test.rb
$ ruby test/folder_node_test.rb
```
