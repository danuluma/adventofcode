data = File.readlines("#{__dir__}/data.txt").map(&:strip)


def count_enc_trees arr, step_y, step_x
    x,y = 0, 0
    path = []
    while x < arr.size - 1     
        if y >= arr[x].size - step_y
            y -= arr[x].size
        end
        x += step_x
        y += step_y
        path << arr[x][y]
    end
    path.count('#')
end


slopes = [[1,1], [3,1], [5,1], [7,1], [1,2]]

def calc_prod d, s
    prod = 1
    s.each do |i|
        y,x = i
        prod *= count_enc_trees d, y, x
    end
    return prod
end


puts calc_prod data, slopes
