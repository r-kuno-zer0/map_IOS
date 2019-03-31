マップアプリについて、マップを表示する際に現在地にピンをおき最初に居た位置にピンが表示され続けるように変更しました。locationManagerの中の  if isPinAdded == false{
        let myLat: CLLocationDegrees = current.coordinate.latitude
        let myLon: CLLocationDegrees = current.coordinate.longitude
        let center: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon)
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.coordinate = center
        mapView.addAnnotation(annotation)
         // Do any additional setup after loading the view, typically from a nib.
            isPinAdded = true
        }
の部分を変更することで、ピンが表示され続けるようにしました。