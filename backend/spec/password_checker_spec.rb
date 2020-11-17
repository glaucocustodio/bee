require_relative '../password_checker'

describe PasswordChecker do
  subject { described_class.new(password) }

  context 'status is strong' do
    let(:password) { 'Ful@ano1' }

    it do
      expect(subject.status).to eq('strong')
    end
  end

  context 'status is ok' do
    context 'password has no symbol' do
      let(:password) { 'Ciclano1' }

      it do
        expect(subject.status).to eq('ok')
      end
    end

    context 'password has sequence' do
      let(:password) { 'Ciclano11' }

      it do
        expect(subject.status).to eq('ok')
      end
    end
  end

  context 'status is weak' do
    context 'password is too short' do
      let(:password) { 'a' }

      it do
        expect(subject.status).to eq('weak')
      end
    end

    context 'password case is invalid' do
      let(:password) { 'abcdef' }

      it do
        expect(subject.status).to eq('weak')
      end
    end

    context 'password has no number' do
      let(:password) { 'Abcdef' }

      it do
        expect(subject.status).to eq('weak')
      end
    end
  end
end
