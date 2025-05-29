
    const provinceSelect = document.getElementById("province");
    const districtSelect = document.getElementById("district");
    const wardSelect = document.getElementById("ward");

    // Load tỉnh/thành phố
    fetch("https://provinces.open-api.vn/api/?depth=1")
      .then(res => res.json())
      .then(data => {
        data.forEach(province => {
          const opt = document.createElement("option");
          opt.value = province.code;
          opt.textContent = province.name;
          provinceSelect.appendChild(opt);
        });
      });

    // Khi chọn tỉnh => Load huyện
    provinceSelect.addEventListener("change", () => {
      const code = provinceSelect.value;
      districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
      wardSelect.innerHTML = '<option value="">Chọn xã/phường</option>';

      if (!code) return;

      fetch(`https://provinces.open-api.vn/api/p/${code}?depth=2`)
        .then(res => res.json())
        .then(data => {
          data.districts.forEach(d => {
            const opt = document.createElement("option");
            opt.value = d.code;
            opt.textContent = d.name;
            districtSelect.appendChild(opt);
          });
        });
    });

    // Khi chọn huyện => Load xã
    districtSelect.addEventListener("change", () => {
      const code = districtSelect.value;
      wardSelect.innerHTML = '<option value="">Chọn xã/phường</option>';

      if (!code) return;

      fetch(`https://provinces.open-api.vn/api/d/${code}?depth=2`)
        .then(res => res.json())
        .then(data => {
          data.wards.forEach(w => {
            const opt = document.createElement("option");
            opt.value = w.code;
            opt.textContent = w.name;
            wardSelect.appendChild(opt);
          });
        });
    });
  