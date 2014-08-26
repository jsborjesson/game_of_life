require './lib/cell'

describe Cell do

  it "is alive or dead based on truthyness of constructor argument" do
    expect(Cell.new(true)).to be_alive
    expect(Cell.new(false)).not_to be_alive
    expect(Cell.new(nil)).not_to be_alive
  end

  it "has nice constructor methods" do
    expect(Cell.alive).to be_alive
    expect(Cell.dead).not_to be_alive
  end

  it "can be compared" do
    expect(Cell.alive).to eq Cell.alive
    expect(Cell.alive).not_to eq Cell.dead
  end

  it "has nice inspect output" do
    expect(Cell.alive.inspect).to eq "#<Cell (alive)>"
    expect(Cell.dead.inspect).to eq "#<Cell (dead)>"
  end

  context "#natural_selection" do
    it 'Rule #1: dies of under-population' do
      expect(Cell.alive.natural_selection(1)).to be_dead
      expect(Cell.alive.natural_selection(0)).to be_dead
    end

    it 'Rule #2: survives good conditions' do
      expect(Cell.alive.natural_selection(2)).to be_alive
      expect(Cell.alive.natural_selection(3)).to be_alive
    end

    it 'Rule #3: dies of overcrowding' do
      expect(Cell.alive.natural_selection(4)).to be_dead
      expect(Cell.alive.natural_selection(8)).to be_dead
    end

    it 'Rule #4: reproduces under good conditions' do
      expect(Cell.dead.natural_selection(3)).to be_alive
      expect(Cell.dead.natural_selection(4)).to be_dead
      expect(Cell.dead.natural_selection(2)).to be_dead
    end

  end


end
