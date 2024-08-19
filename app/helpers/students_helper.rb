module StudentsHelper
    def calculate_attendance_percentage_in_three_months(students_course)
        start_date = Date.new(2024, 1, 8)  # Start date: January 8th, 2024
        end_date = start_date + 3.months   # End date: April 8th, 2024
    
        total_days = (end_date - start_date).to_i  # Total number of days in the period
        present_days = @attendances.where("attendance_date >= ? AND attendance_date <= ?", start_date, end_date).count
    
        attendance_percentage = (present_days.to_f / total_days.to_f) * 100
        attendance_percentage.round(2) 
      end

      def calendar(events, options = {})
      calendar = Calendar.new(events, options)
      calendar.render
    end
end
