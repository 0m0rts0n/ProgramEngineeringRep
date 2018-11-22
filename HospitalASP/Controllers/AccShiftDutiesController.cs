using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using HospitalASP;

namespace HospitalASP.Controllers
{
    public class AccShiftDutiesController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: AccShiftDuties
        public ActionResult Index()
        {
            var accShiftDuties = db.AccShiftDuties.Include(a => a.AccountingWork).Include(a => a.Shift);
            return View(accShiftDuties.ToList());
        }

        // GET: AccShiftDuties/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccShiftDuty accShiftDuty = db.AccShiftDuties.Find(id);
            if (accShiftDuty == null)
            {
                return HttpNotFound();
            }
            return View(accShiftDuty);
        }

        // GET: AccShiftDuties/Create
        public ActionResult Create()
        {
            ViewBag.AccountingID = new SelectList(db.AccountingWorks, "AccountingID", "AccountingID");
            ViewBag.ShiftID = new SelectList(db.Shifts, "ShiftID", "ShiftName");
            return View();
        }

        // POST: AccShiftDuties/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AccountingID,ShiftID,IsDutyDoctor")] AccShiftDuty accShiftDuty)
        {
            if (ModelState.IsValid)
            {
                accShiftDuty.AccountingID = Guid.NewGuid();
                db.AccShiftDuties.Add(accShiftDuty);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AccountingID = new SelectList(db.AccountingWorks, "AccountingID", "AccountingID", accShiftDuty.AccountingID);
            ViewBag.ShiftID = new SelectList(db.Shifts, "ShiftID", "ShiftName", accShiftDuty.ShiftID);
            return View(accShiftDuty);
        }

        // GET: AccShiftDuties/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccShiftDuty accShiftDuty = db.AccShiftDuties.Find(id);
            if (accShiftDuty == null)
            {
                return HttpNotFound();
            }
            ViewBag.AccountingID = new SelectList(db.AccountingWorks, "AccountingID", "AccountingID", accShiftDuty.AccountingID);
            ViewBag.ShiftID = new SelectList(db.Shifts, "ShiftID", "ShiftName", accShiftDuty.ShiftID);
            return View(accShiftDuty);
        }

        // POST: AccShiftDuties/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AccountingID,ShiftID,IsDutyDoctor")] AccShiftDuty accShiftDuty)
        {
            if (ModelState.IsValid)
            {
                db.Entry(accShiftDuty).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AccountingID = new SelectList(db.AccountingWorks, "AccountingID", "AccountingID", accShiftDuty.AccountingID);
            ViewBag.ShiftID = new SelectList(db.Shifts, "ShiftID", "ShiftName", accShiftDuty.ShiftID);
            return View(accShiftDuty);
        }

        // GET: AccShiftDuties/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccShiftDuty accShiftDuty = db.AccShiftDuties.Find(id);
            if (accShiftDuty == null)
            {
                return HttpNotFound();
            }
            return View(accShiftDuty);
        }

        // POST: AccShiftDuties/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            AccShiftDuty accShiftDuty = db.AccShiftDuties.Find(id);
            db.AccShiftDuties.Remove(accShiftDuty);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
