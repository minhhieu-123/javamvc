
  // Khi DOM đã tải xong
  document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search-input');
    const searchBtn = document.getElementById('search-btn');

    function doSearch() {
      const keyword = searchInput.value.trim();
      if (keyword !== '') {
        const url = '/all-product?page=1&sort=no-thing&name=' + encodeURIComponent(keyword);
        window.location.href = url;
      }
    }

    // Bấm nút tìm kiếm
    searchBtn.addEventListener('click', function (e) {
      e.preventDefault();
      doSearch();
    });

    // Nhấn Enter trong ô input
    searchInput.addEventListener('keypress', function (e) {
      if (e.key === 'Enter') {
        e.preventDefault();
        doSearch();
      }
    });
  });

