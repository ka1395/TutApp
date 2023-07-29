class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
 int currentIndex;
SliderViewObject(this.numOfSlides,this.currentIndex,this.sliderObject);
}
