require "spec_helper"

RSpec.describe NASA::MissionControl do
  let(:mission_input) do <<END
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
END
  end

  subject do
    described_class.new(mission_input)
  end

  describe "#intialize" do
    it "sets the plateau size" do
      expect(subject.plateau).to eq(width: 5, height: 5)
    end
  end

  describe "#run_mission" do
    it "has the expected output" do
      expected_output = "1 3 N\n5 1 E"
      expect(subject.run_mission).to eq(expected_output)
    end

    context "when the input would push the rovers out of bounds" do
      let(:mission_input) do <<END
5 5
1 1 N
MMMMM
1 1 E
MMMMM
END
      end

      it "has the expected output" do
        expected_output = "1 5 N\n5 1 E"
        expect(subject.run_mission).to eq(expected_output)
      end
    end
  end
end
