describe "Matcher output" do
  it { expect { puts "Maria" }.to output.to_stdout }
  it { expect { puts "Maria" }.to output("Maria\n").to_stdout }
  it { expect { print "Maria" }.to output("Maria").to_stdout }
  it { expect { puts "Maria C" }.to output(/Maria/).to_stdout }

  it { expect { warn "Maria" }.to output.to_stderr }
  it { expect { warn "Maria" }.to output("Maria\n").to_stderr}
  it { expect { warn "Maria C" }.to output(/Maria/).to_stderr }
end
