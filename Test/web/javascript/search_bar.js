/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function searchFilm() {
        var input, filter, a, i;
        input = document.getElementById('search');
        filter = input.value.toUpperCase();
        var dropdownContent = document.getElementById("dropdown-content");
        var films = document.getElementsByClassName("film-item");

        for (i = 0; i < films.length; i++) {
            a = films[i];
            if (a.textContent.toUpperCase().indexOf(filter) > -1) {
                a.style.display = "";
            } else {
                a.style.display = "none";
            }
        }
        if (dropdownContent.children.length > 0) {
            dropdownContent.style.display = 'block';
        } else {
            dropdownContent.style.display = 'none';
        }
    }

    window.onclick = function(event) {
        if (!event.target.matches('.searchInput') && !event.target.matches('.film-item')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.style.display === 'block') {
                    openDropdown.style.display = 'none';
                }
            }
        }
    };
