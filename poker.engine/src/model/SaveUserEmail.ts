// import { UserSmall } from "./UserSmall";

export class SaveUserEmail {
  _id?: string;//will be a mongodb id
  userEmail: string;
  userSolonaAdd: string;
  createdDate: Date;
   

  constructor(obj: SaveUserEmail = {} as SaveUserEmail) {
    Object.assign(this, obj);
  }

  
}