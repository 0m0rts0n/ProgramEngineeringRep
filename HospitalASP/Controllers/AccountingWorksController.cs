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
    public class AccountingWorksController : Controller
    {
        private HospitalDBEntities db = new HospitalDBEntities();

        // GET: AccountingWorks
        public ActionResult Index()
        {
            var accountingWorks = db.AccountingWorks.Include(a => a.Visit);
            return View(accountingWorks.ToList());
        }

        // GET: AccountingWorks/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountingWork accountingWork = db.AccountingWorks.Find(id);
            if (accountingWork == null)
            {
                return HttpNotFound();
            }
            return View(accountingWork);
        }

        // GET: AccountingWorks/Create
        public ActionResult Create()
        {
            ViewBag.VisitID = new SelectList(db.Visits, "VisitID", "VisitID");
            return View();
        }

        // POST: AccountingWorks/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AccountingID,VisitID")] AccountingWork accountingWork)
        {
            if (ModelState.IsValid)
            {
                accountingWork.AccountingID = Guid.NewGuid();
                db.AccountingWorks.Add(accountingWork);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.VisitID = new SelectList(db.Visits, "VisitID", "VisitID", accountingWork.VisitID);
            return View(accountingWork);
        }

        // GET: AccountingWorks/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountingWork accountingWork = db.AccountingWorks.Find(id);
            if (accountingWork == null)
            {
                return HttpNotFound();
            }
            ViewBag.VisitID = new SelectList(db.Visits, "VisitID", "VisitID", accountingWork.VisitID);
            return View(accountingWork);
        }

        // POST: AccountingWorks/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AccountingID,VisitID")] AccountingWork accountingWork)
        {
            if (ModelState.IsValid)
            {
                db.Entry(accountingWork).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.VisitID = new SelectList(db.Visits, "VisitID", "VisitID", accountingWork.VisitID);
            return View(accountingWork);
        }

        // GET: AccountingWorks/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            AccountingWork accountingWork = db.AccountingWorks.Find(id);
            if (accountingWork == null)
            {
                return HttpNotFound();
            }
            return View(accountingWork);
        }

        // POST: AccountingWorks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            AccountingWork accountingWork = db.AccountingWorks.Find(id);
            db.AccountingWorks.Remove(accountingWork);
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
