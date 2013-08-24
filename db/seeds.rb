bikinis  = [['http://3.bp.blogspot.com/-zpwOjIoeI8w/TlENNc_ax7I/AAAAAAAAWFc/dH-63ZZirQM/s400/bikini%2Bbody%2B%25287%2529.jpg', false],
            ['http://image.made-in-china.com/2f0j00IsfTYrZRFGqa/2012-Sexy-Bikini-3045-2-.jpg', false],
            ['https://si0.twimg.com/profile_images/2328430684/screen-capture.png', false]]

nudes    = [['http://images.fineartamerica.com/images-medium-large-5/art-nude-photography-no1-falko-follert.jpg', true],
            ['http://nakedgirlspics.com/wp-content/uploads/2013/03/Selfshots-11.jpg', true],
            ['http://4.bp.blogspot.com/-ILtd2Hy5fw0/T2cu6rzYv8I/AAAAAAAAJWQ/NjpbeAAYoHQ/s320/Julianne+Hough+nude+in+Burlesque+photosession+UHQ.jpg', true]]

regulars = [['http://www.rolemommy.com/j0422156.jpg', false],
            ['http://blog.nassauinn.com/wp-content/uploads/2012/06/dad.jpg', false],
            ['http://www.keenobservers.com/wp-content/uploads/2010/09/grandparent.jpg', false]]



puts "Seeding sample data..."
[bikinis, nudes, regulars].each do |images|
  images.each do |image|
    Image.create!(image_path: image[0], nude: image[1])
  end
end
puts "Sample data created."
