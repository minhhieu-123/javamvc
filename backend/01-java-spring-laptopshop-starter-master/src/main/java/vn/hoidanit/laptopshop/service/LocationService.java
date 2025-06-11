package vn.hoidanit.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.repository.LocationReponsitory;

@Service
public class LocationService {
    private final LocationReponsitory locationReponsitory;
    public LocationService(LocationReponsitory locationReponsitory) {
        this.locationReponsitory = locationReponsitory;
    }
    public void deleteLocationById(long id){
        this.locationReponsitory.deleteById(id);;
    }
}
