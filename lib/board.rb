class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
    end 

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        count = 0
        @grid.each do |subgrid|
            subgrid.each { |value| count += 1 if value == :S }
        end
        count
    end

    def attack (pos)
        if self[pos] == :S 
            self[pos] = (:H)
            p "you sunk my battleship!"
            true
        else
            self[pos] = (:X)
            false
        end
    end

    def place_random_ships
        count = 0
        l = Math.sqrt(@size)
        while   count / @size.to_f < 0.25
            pos = [rand(0...l), rand(0...l)]
            if  self[pos] != :S
                self[pos] = :S
                count += 1 
            end
        end
    end

    def hidden_ships_grid
        hidden = []
        @grid.each do |subgrid|
            temp = []
            subgrid.each { |val| temp << val }
            hidden << temp
        end
        hidden.each do |subgrid|
            subgrid.each_with_index { |val, idx| subgrid[idx] = :N if val == :S }
        end
        hidden
    end

    def self.print_grid(grid)
        grid.each do |subgrid|
            puts subgrid.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
