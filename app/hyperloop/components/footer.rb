class Footer < Hyperloop::Component
  render(SECTION, class: 'bg-dark') do
    DIV(class: 'container') do
      DIV(class: 'row viewport-30 p-5') do
        DIV(class: 'col col-md-4') do
          H3(class: 'text-center') { 'Column 1' }
          P do
            "Lorem ipsum amet a urna proin nulla sit non tellus: urna sem curabitur,
             sagittis vulputate tempus quisque sed at nam risus maecenas at integer fusce."
          end
        end
        DIV(class: 'col col-md-4') do
          H3(class: 'text-center') { 'Column 2' }
          P do
            "Quam massa, quisque vitae massa sit arcu — bibendum nec elementum tellus — fusce integer.
            Quam nec eu elementum nibh cursus sit arcu, vivamus quam, pellentesque bibendum a commodo congue.
            Donec ornare molestie eu nam, maecenas porta quisque auctor leo quisque."
          end
        end
        DIV(class: 'col col-md-4') do
          H3(class: 'text-center') { 'Column 3' }
          P do
            "Risus quisque metus tellus metus sit vitae amet tellus quam tempus molestie et sem, amet ipsum quam diam pharetra massa quisque eget justo.
            Risus nibh integer nec morbi diam gravida elementum, tellus mauris, nec tellus, congue leo, non risus."
          end
        end
      end
    end
  end
end
