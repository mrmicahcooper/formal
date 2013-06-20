require 'spec_helper'
require 'formal'

describe Formal::FormBuilder do
  include FormalSpecHelper

  describe "#label" do
    describe 'when in a valid state' do
      context 'and text is provided' do
        it 'returns element with provided text' do
          form_for(TestValid.new, builder: described_class) do |f|
            label = f.label(:body, "PROVIDED TEXT")
            expected_result = "<label for=\"test_valid_body\">PROVIDED TEXT</label>"
            expect(label).to eq(expected_result)
          end
        end
      end

      context 'and local is unavailable' do
        it 'returns a properly populated label element' do
          form_for(TestValid.new, builder: described_class) do |f|
            label = f.label(:body)
            expected_result = "<label for=\"test_valid_body\">Body</label>"
            expect(label).to eq(expected_result)
          end
        end
      end

      context 'and locale is available' do
        before do
          I18n.config.backend.load_translations(fixture_locale(:en))
        end

        after do
          I18n.config.backend.reload!
        end

        it 'returns a properly populated label element' do
          form_for(TestValid.new, builder: described_class) do |f|
            label = f.label(:body)
            expected_result = "<label for=\"test_valid_body\">VALID</label>"
            expect(label).to eq(expected_result)
          end
        end
      end
    end

    describe "when in an invalid state" do
      context "and locale is unavailable" do
        it 'returns a label with nested error element' do
          form_for(TestInvalid.new, builder: described_class) do |f|
            label = f.label(:body)
            expected_result = "<label for=\"test_invalid_body\">Body <span class=\"error\">ERROR</span></label>"
            expect(label).to eq(expected_result)
          end
        end
      end

      context 'and locale is available' do
        before do
          I18n.config.backend.load_translations(fixture_locale(:en))
        end

        after do
          I18n.config.backend.reload!
        end

        it 'returns a label with nested error element' do
          form_for(TestInvalid.new, builder: described_class) do |f|
            label = f.label(:body)
            expected_result = "<label for=\"test_invalid_body\">INVALID <span class=\"error\">ERROR</span></label>"
            expect(label).to eq(expected_result)
          end
        end
      end
    end

    describe 'error element' do
      context 'when default' do
        it 'returns span markup' do
          form_for(TestInvalid.new, builder: described_class) do |f|
            label = f.label(:body)
            expected_result = "<label for=\"test_invalid_body\">Body <span class=\"error\">ERROR</span></label>"
            expect(label).to eq(expected_result)
          end
        end
      end

      context 'when passed in' do
        it 'returns passed in markup' do
          form_for(TestInvalid.new, builder: described_class) do |f|
            label = f.label(:body, nil, error_element: :small)
            expected_result = "<label for=\"test_invalid_body\">Body <small class=\"error\">ERROR</small></label>"
            expect(label).to eq(expected_result)
          end
        end
      end
    end

    describe 'hide errors' do
      it 'removes error markup' do
        form_for(TestInvalid.new, builder: described_class) do |f|
          label = f.label(:body, nil, hide_errors: true)
          expected_result = "<label for=\"test_invalid_body\">Body</label>"
          expect(label).to eq(expected_result)
        end
      end
    end
  end
end
