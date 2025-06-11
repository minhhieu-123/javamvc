  document.addEventListener("DOMContentLoaded", function () {
    const toast = document.getElementById("toast");
    const message = toast.getAttribute("data-message");

    if (message && message.trim() !== "" && message !== "${message}") {
      toast.textContent = message;
      toast.style.display = "block";
      setTimeout(() => {
        toast.style.display = "none";
      }, 3000);
    }
  });
    const el = document.getElementById("myDateTime");
  const input = el.textContent.trim();

  // Kiểm tra chuỗi hợp lệ rồi format
  if (input.includes("T")) {
    const [datePart, timePart] = input.split("T");
    const [year, month, day] = datePart.split("-");
    const formattedDate = `${day}/${month}/${year}`;
    const result = `${formattedDate}-${timePart}`;
    
    // Gán lại vào phần tử
    el.textContent = result;
  }