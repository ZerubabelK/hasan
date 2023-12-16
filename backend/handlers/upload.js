const { gql } = require("graphql-tag");
const apollo_client = require("../utils/apollo");
const fs = require("fs");
const cloudinary = require("cloudinary").v2;

// Request Handler

cloudinary.config({
  cloud_name: "dijyjsiki",
  api_key: "967139981637272",
  api_secret: "M6ojtd851hjYcld_wJOwlKrcraY",
});

const uploadImage = async (req, res) => {
  try {
    const { image, folder } = req.body.input;

    let secure_urls = "";

    let urls = "";

    let data = await cloudinary.uploader.upload(image, {
      unique_filename: true,
      discard_original_filename: true,
      folder: folder, 
      timeout: 120000,
    });

    secure_urls = data.secure_url; 

    urls = data.url;

    console.log(urls);

    // success
    return res.json({
      path: urls,
    });
  } catch (error) {
    console.error(error);

        res.status(500).send({
            message: "Error Uploading Files",
        });


  }
};

module.exports = uploadImage;