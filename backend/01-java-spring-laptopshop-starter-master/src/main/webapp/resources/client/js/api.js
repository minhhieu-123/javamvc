const provinceSelect = document.getElementById("province");
const districtSelect = document.getElementById("district");
const wardSelect = document.getElementById("ward");

// Load tỉnh/thành phố
fetch("https://provinces.open-api.vn/api/?depth=1")
  .then(res => res.json())
  .then(data => {
    data.forEach(province => {
      const opt = document.createElement("option");
      opt.value = province.name; // dùng tên
      opt.textContent = province.name;
      provinceSelect.appendChild(opt);
    });
  });

// Khi chọn tỉnh => Load huyện
provinceSelect.addEventListener("change", () => {
  const code = provinceSelect.selectedOptions[0].getAttribute("data-code");
  const name = provinceSelect.value;
  districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
  wardSelect.innerHTML = '<option value="">Chọn xã/phường</option>';

  if (!name) return;

  // Vì bạn chọn theo name nên phải gọi lại để lấy đúng code theo name
  fetch("https://provinces.open-api.vn/api/?depth=2")
    .then(res => res.json())
    .then(data => {
      const province = data.find(p => p.name === name);
      if (province) {
        province.districts.forEach(d => {
          const opt = document.createElement("option");
          opt.value = d.name; // dùng tên
          opt.textContent = d.name;
          districtSelect.appendChild(opt);
        });
      }
    });
});

// Khi chọn huyện => Load xã
districtSelect.addEventListener("change", () => {
  const provinceName = provinceSelect.value;
  const districtName = districtSelect.value;

  wardSelect.innerHTML = '<option value="">Chọn xã/phường</option>';

  fetch("https://provinces.open-api.vn/api/?depth=3")
    .then(res => res.json())
    .then(data => {
      const province = data.find(p => p.name === provinceName);
      if (province) {
        const district = province.districts.find(d => d.name === districtName);
        if (district) {
          district.wards.forEach(w => {
            const opt = document.createElement("option");
            opt.value = w.name; // dùng tên
            opt.textContent = w.name;
            wardSelect.appendChild(opt);
          });
        }
      }
    });
});


