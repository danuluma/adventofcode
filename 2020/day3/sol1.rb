data = File.readlines("#{__dir__}/data.txt").map(&:strip)


def count_enc_trees arr
    x,y = 0, 0
    path = []
    while x < arr.size - 1     
        if y >= arr[x].size - 3
            y -= arr[x].size
        end
        x += 1
        y += 3
        path << arr[x][y]
    end
    path.count('#')
end


puts count_enc_trees data



