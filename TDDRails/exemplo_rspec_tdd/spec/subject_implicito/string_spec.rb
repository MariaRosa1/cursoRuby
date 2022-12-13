require 'string_nao_vazia'

describe String do
  describe StringNaoVazia do
    it "nao vazia" do
      expect(subject).to eq("Não sou vazia")
    end
  end
end
