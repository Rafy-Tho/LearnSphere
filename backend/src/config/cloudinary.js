import { v2 as cloudinary } from 'cloudinary';
import environment from './environment.js';
const connectCloudinary = async () => {
  cloudinary.config({
    cloud_name: environment.CLOUDINARY_NAME,
    api_key: environment.CLOUDINARY_API_KEY,
    api_secret: environment.CLOUDINARY_SECRET_KEY,
  });
};

export default connectCloudinary;
