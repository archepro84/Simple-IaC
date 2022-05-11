import {Injectable} from '@nestjs/common';
import * as ip from 'ip';

@Injectable()
export class AppService {
    getIp(): object {
        return {privateIp: ip.address()};
    }
}
