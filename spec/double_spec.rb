require "spec_helper"

RSpec.describe "Doubles" do
  # Instead of using instances in these tests,
  # replace each of these with a 'leaf' test double
  it "leaf returns expected color" do
    leaf = double("is the leaf is green", color: "green")

    expect(leaf.color).to eq("green")

    expect(leaf).to_not be_instance_of(Leaf)
  end

  it "leaf's branch returns expected length" do
    leaf = double("does leaf have a branch", branch: double("is the length 4", length: "4 feet"))

    expect(leaf.branch.length).to eq("4 feet")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
  end

  it "leaf's branch's tree returns expected bark" do

    leaf = double("does it have branch", branch: double("does it have tree", tree: double("is the bark thick and brown", bark: "thick and brown")))

    expect(leaf.branch.tree.bark).to eq("thick and brown")

    expect(leaf).to_not be_instance_of(Leaf)
    expect(leaf.branch).to_not be_instance_of(Branch)
    expect(leaf.branch.tree).to_not be_instance_of(Tree)
  end
end
