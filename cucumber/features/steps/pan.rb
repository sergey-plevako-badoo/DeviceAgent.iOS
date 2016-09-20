
module TestApp
  module Pan

    def clear_pan_action_label
      touch({marked: "pan action"})
      wait_for_pan_action_text("CLEARED")
    end

    def wait_for_pan_action_text(text)
      wait_for_text_in_view(text, {marked: "pan action"})
    end

    def pan(direction, mark, duration, size, wait_options={})

      uiquery = {marked: mark}
      case size
        when :large
          from_point = point_for_full_pan_start(direction, uiquery, wait_options)
          to_point = point_for_full_pan_end(direction, uiquery, wait_options)
        when :medium
          from_point = point_for_medium_pan_start(direction, uiquery, wait_options)
          to_point = point_for_medium_pan_end(direction, uiquery, wait_options)
        when :small
         raise "NYI"
        else
          raise ArgumentError, "Expected '#{size}' to be :large, :medium, :small"
      end

      pan_between_coordinates(from_point, to_point,
                                        {duration: duration})
    end

    def scroll(direction, mark, wait_options={})
      pan(direction, mark, 1.0, :medium, wait_options)
    end

    alias_method :swipe, :scroll

    def flick(direction, mark, wait_options={})
      pan(direction, mark, 0.1, :medium, wait_options)
    end

    def scroll_to(direction, scroll_view_mark, view_mark, times)
      return if !query({marked: view_mark}).empty?

      found = false

      times.times do
        scroll(direction, scroll_view_mark)
        # Gesture takes 1.0 seconds
        sleep(1.5)

        view = query({marked: view_mark}).first
        if view
          hit_point = view["hit_point"]
          element_center = element_center(view)
          found = hit_point_same_as_element_center(hit_point, element_center)
        end

        break if found
      end

      if !found
        fail(%Q[
Scrolled :#{direction} on '#{scroll_view_mark}' #{times} times,
but did not see '#{view_mark}'
])
      end
    end

    def flick_to(direction, scroll_view_mark, view_mark, times)
      return if !query({marked: view_mark}).empty?

      found = false

      times.times do
        flick(direction, scroll_view_mark)
        # Gesture takes 0.1 seconds
        sleep(1.0)

        view = query({marked: view_mark}).first
        if view
          hit_point = view["hit_point"]
          element_center = element_center(view)
          found = hit_point_same_as_element_center(hit_point, element_center)
        end

        break if found
      end

      if !found
        fail(%Q[
Flicked :#{direction} on '#{scroll_view_mark}' #{times} times,
but did not see '#{view_mark}'
])
      end
    end
  end
end

World(TestApp::Pan)

And(/^I am looking at the Pan Palette page$/) do
  wait_for_view({marked: "pan page"})
  touch({marked: "pan palette row"})
  wait_for_view({marked: "pan palette page"})
  wait_for_animations
end

Given(/^I am looking at the Drag and Drop page$/) do
  wait_for_animations
  touch({marked: "drag and drop row"})
  wait_for_view({marked: "drag and drop page"})
  wait_for_animations
end

Given(/^I am looking at the Everything's On the Table page$/) do
  wait_for_animations
  touch({marked: "table row"})
  wait_for_view({marked: "table page"})
  wait_for_animations
end

And(/^I can pan with (\d+) fingers?$/) do |fingers|
  clear_pan_action_label

  options = {
    :num_fingers => fingers.to_i,
    :duration => 0.5
  }

  if fingers.to_i > 3
    from_point = {:x => 160, :y => 80}
    to_point = {:x => 160, :y => 460}
  else
    from_point = {:x => 20, :y => 80}
    to_point = {:x => 300, :y => 460}
  end

  pan_between_coordinates(from_point, to_point, options)

  wait_for_pan_action_text("Pan")
  clear_pan_action_label
end

But(/^I cannot pan with 6 fingers$/) do
  options = {
    :num_fingers => 6,
    :duration => 0.5
  }

  from_point = {:x => 20, :y => 80}
  to_point = {:x => 300, :y => 460}

  expect do
    pan_between_coordinates(from_point, to_point, options)
  end.to raise_error RunLoop::DeviceAgent::Client::HTTPError,
                     /num_fingers must be between 1 and 5, inclusive/
end

And(/^I can pan (quickly|slowly)$/) do |speed|
  clear_pan_action_label

  if speed == "quickly"
    duration = 0.1
  else
    duration = 1.0
  end

  options = {
    :duration => duration
  }

  from_point = {:x => 160, :y => 80}
  to_point = {:x => 160, :y => 460}
  pan_between_coordinates(from_point, to_point, options)

  wait_for_pan_action_text("Pan")
  clear_pan_action_label
end

Then(/^I can drag the red box to the right well$/) do
  # TODO Figure out how to query for these elements so we can test in other
  # orientations and form factors.
  rotate_home_button_to(:bottom)

  from_point = {:x => 83.5, :y => 124}
  to_point = {:x => 105.5, :y => 333.5}
  pan_between_coordinates(from_point, to_point)

  # TODO figure out how to assert the drag and drop happened.
end

Then(/^I can scroll down to the Windows row$/) do
  scroll_view_mark = "table page"
  view_mark = "windows row"
  scroll_to(:up, scroll_view_mark, view_mark, 5)
  # TODO touch the row
end

And(/^then back up to the Apple row$/) do
  scroll_view_mark = "table page"
  view_mark = "apple row"
  scroll_to(:down, scroll_view_mark, view_mark, 5)
  # TODO touch the row
end

Given(/^I see the Apple row$/) do
  scroll_view_mark = "table page"
  view_mark = "apple row"

  if query({marked: view_mark}).empty?
    scroll_to(:down, scroll_view_mark, view_mark, 5)
  end
end

Then(/^I can flick to the bottom of the Companies table$/) do
  scroll_view_mark = "table page"
  view_mark = "youtube row"
  flick_to(:up, scroll_view_mark, view_mark, 1)
end

Then(/^I can flick to the top of the Companies table$/) do
  scroll_view_mark = "table page"
  view_mark = "amazon row"
  flick_to(:down, scroll_view_mark, view_mark, 1)
end

And(/^I can swipe to delete the Windows row$/) do
  identifier = "windows row"
  wait_for_view({marked: identifier})

  swipe(:left, identifier)
  touch({marked: "Delete"})

  wait_for_no_view({marked: "Delete"})
end

And(/^I have scrolled to the top of the Companies table$/) do
  element = wait_for_view({type: "StatusBar", :all => true})
  center = element_center(element)
  touch_coordinate(center)
  sleep(0.4)
end

When(/^I touch the Edit button, the table is in Edit mode$/) do
  touch({marked: "Edit"})
  wait_for_view({marked: "Done"})
end

Then(/^I move the Android row above the Apple row$/) do
  android_element = wait_for_view({marked: "Reorder Android"})
  android_center = element_center(android_element)
  apple_element = wait_for_view({marked: "Reorder Apple"})
  apple_center = element_center(apple_element)

  from_point = {x: android_center[:x], y: android_center[:y]}
  to_point = {x: apple_center[:x], y: apple_center[:y]}
  pan_between_coordinates(from_point, to_point)
  sleep(0.4)
  touch({marked: "Done"})
end