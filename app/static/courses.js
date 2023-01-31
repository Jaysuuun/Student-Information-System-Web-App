
$.ajax({
    url: '/get-colleges',
    type: 'GET',
    success: function(response) {
      var colleges = response.colleges;
      var select = $('#colleges');
      for (var i = 0; i < colleges.length; i++) {
        select.append('<option value="' + colleges[i][0] + '">' + colleges[i][1] + '</option>');
    }

    }
  });
  

  $(document).ready(function() {
    $('#colleges').change(function(){
        var selectedCollege = $(this).val();
        $.ajax({
            url: '/get-courses',
            type: 'GET',
            data: { college: selectedCollege },
            success: function(response) {
                var courses = response.courses;
                var select = $('#courses');
                select.empty(); 
                for (var i = 0; i < courses.length; i++) {
                    select.append('<option value="' + courses[i][0] + '">' + courses[i][1] + '</option>');
                }
            }
        });
    });
});
