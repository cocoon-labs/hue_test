import org.apache.http.nio.reactor.ssl.*;
import org.apache.http.auth.params.*;
import org.apache.http.pool.*;
import org.apache.http.conn.socket.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.io.*;
import com.mashape.unirest.request.*;
import org.apache.http.cookie.*;
import com.mashape.unirest.http.*;
import org.apache.http.conn.ssl.*;
import org.apache.http.client.entity.*;
import org.apache.http.client.protocol.*;
import org.apache.http.nio.protocol.*;
import org.apache.http.config.*;
import org.apache.commons.logging.*;
import org.apache.http.nio.params.*;
import org.json.*;
import com.mashape.unirest.http.exceptions.*;
import org.apache.http.impl.nio.ssl.*;
import org.apache.http.impl.nio.reactor.*;
import com.mashape.unirest.request.body.*;
import org.apache.http.io.*;
import com.mashape.unirest.http.utils.*;
import com.mashape.unirest.http.async.*;
import org.apache.http.nio.conn.scheme.*;
import org.json.zip.*;
import org.apache.http.impl.entity.*;
import org.apache.http.impl.client.*;
import org.apache.http.conn.scheme.*;
import org.apache.http.impl.auth.*;
import org.apache.http.params.*;
import org.apache.http.client.config.*;
import org.apache.commons.codec.language.*;
import org.apache.http.nio.client.util.*;
import org.apache.http.nio.client.methods.*;
import org.apache.http.impl.nio.conn.*;
import org.apache.http.message.*;
import org.apache.http.conn.util.*;
import org.apache.http.cookie.params.*;
import org.apache.http.entity.mime.*;
import org.apache.commons.logging.impl.*;
import org.apache.http.impl.execchain.*;
import com.mashape.unirest.http.options.*;
import org.apache.http.*;
import org.apache.http.impl.conn.tsccm.*;
import org.apache.http.impl.conn.*;
import org.apache.http.protocol.*;
import org.apache.http.conn.routing.*;
import org.apache.http.conn.params.*;
import org.apache.http.nio.client.*;
import org.apache.http.impl.nio.pool.*;
import org.apache.commons.codec.digest.*;
import org.apache.http.auth.*;
import org.apache.http.client.params.*;
import org.apache.http.impl.cookie.*;
import org.apache.http.nio.conn.*;
import org.apache.http.impl.nio.client.*;
import org.apache.commons.codec.*;
import org.apache.http.entity.mime.content.*;
import org.apache.http.impl.nio.*;
import org.apache.http.nio.entity.*;
import org.apache.http.impl.*;
import org.apache.http.concurrent.*;
import org.apache.http.impl.pool.*;
import org.apache.http.client.*;
import org.apache.commons.codec.binary.*;
import org.apache.http.impl.nio.codecs.*;
import com.mashape.unirest.http.async.utils.*;
import org.apache.http.nio.conn.ssl.*;
import org.apache.http.nio.util.*;
import org.apache.http.conn.*;
import org.apache.http.nio.reactor.*;
import org.apache.http.client.utils.*;
import org.apache.http.nio.*;
import org.apache.http.nio.pool.*;
import org.apache.http.entity.*;
import org.apache.commons.codec.net.*;
import org.apache.http.annotation.*;
import org.apache.http.util.*;
import org.apache.commons.codec.language.bm.*;

String bridge = "http://192.168.1.200";
int hue = 0;
int nBulbs = 2;

void setup() {
  size(2000,2000);
  for (int i = 1; i < nBulbs + 1; i++) {
    setEffectNone(i);
    setOn(i, true);
  }
  
}

void draw() {
  
}

void setEffectNone(int bulb) {
  try {
    Unirest.put(bridge + "/api/newdeveloper/lights/" + bulb + "/state")
      .header("accept", "application/json")
      .body("{\"effect\": \"none\"}")
      .asJson();
  } catch (UnirestException ue) {
    handler();
  }
}

void setOn(int bulb, boolean on) {
  try {
    Unirest.put(bridge + "/api/newdeveloper/lights/" + bulb + "/state")
      .header("accept", "application/json")
      .body("{\"on\": " + on + "}")
      .asJson();
  } catch (UnirestException ue) {
    handler();
  }
}

void setBri(int bulb, int bri) {
  bri = constrain(bri, 1, 254);
  try {
    Unirest.put(bridge + "/api/newdeveloper/lights/" + bulb + "/state")
      .header("accept", "application/json")
      .body("{\"bri\": " + bri + "}")
      .asJson();
  } catch (UnirestException ue) {
    handler();
  }
}

void setHue(int bulb, int hue) {
  try {
    Unirest.put(bridge + "/api/newdeveloper/lights/" + bulb + "/state")
      .header("accept", "application/json")
      .body("{\"hue\": " + hue + "}")
      .asJson();
  } catch (UnirestException ue) {
    handler();
  }
}

void handler() {
  println("blewit");
}

void mouseClicked() {
  int hueX = (int) map(mouseX, 0, width, 0, 65535);
  setHue(1, hueX);
  setHue(2, hueX);
  int bri = (int) map(mouseY, 0, height, 1, 254);
  setBri(1, bri);
  setBri(2, bri);
}
