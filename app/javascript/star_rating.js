document.addEventListener("turbo:load", () => {
     const stars = document.querySelectorAll("#star-rating .star");
     const hiddenField = document.getElementById("record_star_rating");
     
     stars.forEach(star => {
         star.addEventListener("click", () => {
             const rating = star.dataset.value;
             hiddenField.value = rating;
             
             stars.forEach(s => {
                 s.textContent = s.dataset.value <= rating ? "★" : "☆";
             });
         });
     });
 });