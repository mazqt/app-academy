class Player

    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        nums = []
        gets.chomp.split.each { |num| nums << num.to_i}
        nums
    end

end
