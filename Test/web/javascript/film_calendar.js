/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const movies = [
    {
        title: "Mai",
        date: "2024-03-07",
        start_time: "10:00 AM",
        end_time: "11:30 AM",
        room: 'Phòng 1',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Mai",
        date: "2024-03-07",
        start_time: "13:00 PM",
        end_time: "15:30 AM",
        room: 'Phòng 3',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Mai",
        date: "2024-03-07",
        start_time: "04:00 PM",
        end_time: "06:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Fast & Furious 9",
        date: "2024-03-10",
        start_time: "01:00 PM",
        end_time: "03:30 PM",
        room: 'Phòng 3',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Black Widow",
        date: "2024-03-08",
        start_time: "04:00 PM",
        end_time: "06:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Soul",
        date: "2024-03-09",
        start_time: "07:00 PM",
        end_time: "09:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Kẻ Trộm Mặt Trăng 3",
        date: "2024-03-07",
        start_time: "10:30 AM",
        end_time: "12:30 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Quái Vật Săn Mồi 2",
        date: "2024-03-07",
        start_time: "01:30 PM",
        end_time: "03:30 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Người Nhện: Tái Xuất",
        date: "2024-03-13",
        start_time: "04:30 PM",
        end_time: "06:30 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Vũ Điệu Đêm Hè",
        date: "2024-03-08",
        start_time: "11:00 AM",
        end_time: "01:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Vũ Điệu Đêm Hè",
        date: "2024-03-08",
        start_time: "09:00 PM",
        end_time: "11:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Thám Tử Lừng Danh Conan",
        date: "2024-03-08",
        start_time: "02:00 PM",
        end_time: "04:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Người Dơi: Siêu Nhân Hành Động",
        date: "2024-03-08",
        start_time: "05:00 PM",
        end_time: "07:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Mắt Biếc",
        date: "2024-03-09",
        start_time: "10:00 AM",
        end_time: "12:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Sài Gòn Trong Cơn Mưa 2",
        date: "2024-03-09",
        start_time: "01:30 PM",
        end_time: "03:30 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Cuộc Chiến Hòa Bình",
        date: "2024-03-09",
        start_time: "04:30 PM",
        end_time: "06:30 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Hoa Thần",
        date: "2024-03-10",
        start_time: "03:00 PM",
        end_time: "05:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Phương Pháp Luyện Giai Điệu 2",
        date: "2024-03-10",
        start_time: "06:00 PM",
        end_time: "08:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Ninja Cuối Cùng",
        date: "2024-03-11",
        start_time: "11:00 AM",
        end_time: "01:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Nữ Anh Hùng",
        date: "2024-03-11",
        start_time: "01:00 PM",
        end_time: "03:00 PM",
        room: 'Phòng 2',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Nữ Anh Hùng",
        date: "2024-03-11",
        start_time: "04:00 PM",
        end_time: "06:00 PM",
        room: 'Phòng 3',
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Chị Mười Ba: 3 Ngày Sinh Tử",
        date: "2024-03-11",
        start_time: "05:00 PM",
        end_time: "07:00 PM",
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Bí Mật Của Hạnh Phúc",
        date: "2024-03-12",
        start_time: "10:30 AM",
        end_time: "12:30 PM",
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Vết Cắt Gió",
        date: "2024-03-12",
        start_time: "01:30 PM",
        end_time: "03:30 PM",
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Thợ Săn Địa Ngục",
        date: "2024-03-12",
        start_time: "04:30 PM",
        end_time: "06:30 PM",
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Thất Sơn Tâm Linh",
        date: "2024-03-13",
        start_time: "10:00 AM",
        end_time: "12:00 PM",
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Gia Đình Nhà Bambi",
        date: "2024-03-06",
        start_time: "01:30 PM",
        end_time: "03:30 PM",
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    },
    {
        title: "Bí Mật Bóng Đêm",
        date: "2024-03-13",
        start_time: "04:30 PM",
        end_time: "06:30 PM",
        image: "https://th.bing.com/th/id/OIP.DMTjJ1YCM8M-VagUW2QMuQHaJQ?rs=1&pid=ImgDetMain",
    }
];
const movieList = document.getElementById("movieList");
const dateInput = document.getElementById("date");

// Khởi tạo Flatpickr để tạo date picker
flatpickr(dateInput, {
    dateFormat: "Y-m-d",
    onChange: (selectedDates, dateStr) => {
        renderMovies(dateStr);
    }
});

// Hàm để hiển thị phim dựa trên ngày được chọn
function renderMovies(selectedDate) {
    movieList.innerHTML = "";

    const selectedMovies = movies.filter(movie => movie.date === selectedDate);

    if (selectedMovies.length === 0) {
        const noMovieElement = document.createElement("div");
        noMovieElement.classList.add("no-movie");
        noMovieElement.textContent = "Không có suất chiếu cho ngày này.";
        movieList.appendChild(noMovieElement);
    } else {
        const movieGroups = {};
        selectedMovies.forEach((movie) => {
            const movieKey = movie.title + movie.date;
            if (movieKey in movieGroups) {
                movieGroups[movieKey].times.push({
                    start_time: movie.start_time,
                    end_time: movie.end_time,
                    room: movie.room,
                });
            } else {
                movieGroups[movieKey] = {
                    title: movie.title,
                    date: movie.date,
                    image: movie.image,
                    times: [{
                            start_time: movie.start_time,
                            end_time: movie.end_time,
                            room: movie.room,
                        }],
                };
            }
        });

        for (const [key, movie] of Object.entries(movieGroups)) {
            const movieElement = document.createElement("div");
            movieElement.classList.add("movie");

            let timesHtml = "";
            if (movie.times.length > 1) {
                timesHtml = movie.times.map(time => `
                    <div class="time-option">
                        <button class="time-btn">
                             <a href="full_seat.jsp" class="time-link" data-room="${time.room}">
                                ${time.start_time} - ${time.end_time}
                                <p class="room">Phòng Chiếu: ${time.room}</p>
                            </a>
                        </button>
                    </div>
                `).join('');
            } else {
                timesHtml = `
                    <div class="time-option">
                        <button class="time-btn">
                            <a href="full_seat.jsp" class="time-link" data-room="${movie.times[0].room}">
                                ${movie.times[0].start_time} - ${movie.times[0].end_time}
                                <p class="room"> Phòng Chiếu: ${movie.times[0].room}</p>
                            </a>
                        </button>
                    </div>
                `;
            }

            movieElement.innerHTML = `
                <h2 class="movie-title">${movie.title}</h2>
                <div class="movie-content">
                    <img src="${movie.image}" alt="${movie.title}" class="movie-image">
                    <div class="movie-details">
                        <div class="time-options">
                            ${timesHtml}
                        </div>
                    </div>
                </div>
            `;

            movieList.appendChild(movieElement);
        }

        const timeButtons = document.querySelectorAll(".time-btn");
        timeButtons.forEach(button => {
            button.addEventListener("click", () => {
                const selectedTime = button.textContent.split(' - ')[0];
                const selectedRoom = button.getAttribute("data-room");
                //alert(`Bạn đã chọn khung giờ: ${selectedTime}, Phòng Chiếu: ${selectedRoom}`);
                //window.location.href = `ChonGhe.jsp?start_time=${selectedTime}&room=${selectedRoom}`;
                //Truyền trang jsp
            });
        });
    }
}

const currentDate = new Date();
const currentDateString = currentDate.toISOString().slice(0, 10);
renderMovies(currentDateString);


