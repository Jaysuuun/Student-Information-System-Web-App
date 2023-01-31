$(document).ready( function () {
    $('#table').DataTable({     
        "aLengthMenu": [[3, 5, 10, 25, -1], [3, 5, 10, 25, "All"]],
          "iDisplayLength": 10,
          "columns": [
            {"width": "5%"},
            { "width": "10%" },
            { "width": "10%" },
            null,
            null,
            null,
            null,
            null,
            { "width": "10%"},
            null]
         } );
} );

$(document).ready( function () {
  $('#table1').DataTable({     
      "aLengthMenu": [[3, 5, 10, 25, -1], [3, 5, 10, 25, "All"]],
        "iDisplayLength": 10
        
       } );
} );

$(document).ready( function () {
  $('#table2').DataTable({     
      "aLengthMenu": [[3, 5, 10, 25, -1], [3, 5, 10, 25, "All"]],
        "iDisplayLength": 10
      
       } );
} );

setTimeout(function() {
  $(".alert").fadeOut();
}, 1000);
