RSpec.describe WrapWord do
  it "has a version number" do
    expect(WrapWord::VERSION).not_to be nil
  end

  # it "does something useful" do
  #   expect(false).to eq(true)
  # end

  it "#empty string returns empty string" do
    expect(WrapWord::wrap("", 1)).to eq("")
  end
  it "#string less than column returns string" do
    expect(WrapWord::wrap("string", 7)).to eq("string")
  end
  it "#string (no spaces) split once" do
    expect(WrapWord::wrap("string", 3)).to eq("str\ning")
  end
  it "#string (no spaces) split many times" do
    expect(WrapWord::wrap("abcdefghijk", 3)).to eq("abc\ndef\nghi\njk")
  end
  it "#wraps on word boundary" do
    expect(WrapWord::wrap("word wrap", 5)).to eq("word\nwrap")
  end
  it "wraps on word boundary that is immediately after the column" do
    expect(WrapWord::wrap("word wrap", 4)).to eq("word\nwrap")
  end
  it "wraps on word boundary before column" do
    expect(WrapWord::wrap("word wrap", 6)).to eq("word\nwrap")
  end
  it "wraps before word boundary" do
    expect(WrapWord::wrap("word wrap", 3)).to eq("wor\nd\nwra\np")
  end
  it "#keeps as many words on one line as possible" do
    expect(WrapWord::wrap("long long word", 10)).to eq("long long\nword")
  end
end
