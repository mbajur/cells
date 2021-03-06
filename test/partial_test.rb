require "test_helper"
require "cell/partial"

class PartialTest < MiniTest::Spec
  class WithPartial < Cell::ViewModel
    self.view_paths = ['test/fixtures'] # doesn't exist.
    self.template_engine = :erb

    include Partial

    def show
      render partial: "../fixtures/partials/show.html"
    end

    def show_with_format
      render partial: "../fixtures/partials/show", formats: [:xml]
    end

    def show_without_partial
      render :show
    end
  end

  it { WithPartial.new(nil).show.must_equal "I Am Wrong And I Am Right" }
  it { WithPartial.new(nil).show_with_format.must_equal "<xml>I Am Wrong And I Am Right</xml>" }
  it { WithPartial.new(nil).show_without_partial.must_equal "Adenosine Breakdown" }
end